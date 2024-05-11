
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ui1/Home_page.dart';

class web_page extends StatefulWidget {
  const web_page({Key? key}) : super(key: key);

  @override
  State<web_page> createState() => _web_pageState();
}

class _web_pageState extends State<web_page> {
  String? Url;
  double Progress = 0;
  InAppWebViewController? web;
  String? current;
  bool ForWord = false;
  bool Back = false;
  PullToRefreshController? Refresh;

  @override
  void initState() {
    super.initState();

    Refresh = PullToRefreshController(
      onRefresh: () {
        web!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Url = ModalRoute.of(context)!.settings.arguments as String?;
    return WillPopScope(
      onWillPop: () async {
        await web!.goBack();
        return (current == Url) ? true : false;
      },
      child: Scaffold(
        appBar:
        PreferredSize(child:  AppBar(backgroundColor: Colors.yellow.shade700,
          title: const Text(
            "Freecodecamp",
            style: TextStyle(fontSize: 25,color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home_page();
              },));
            },
            icon: const Icon(size: 20,
              Icons.arrow_back_outlined,
            ),
          ),
          actions: [
            (Back)
                ? IconButton(
              onPressed: () async {
                if (web != null) {
                  await web!.goBack();
                }
                setState(() {});
              },
              icon: const Icon(size: 20,
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
                : Container(),
            IconButton(
              onPressed: () async {
                if (web != null) {
                  await web!.reload();
                }
                setState(() {});
              },
              icon: const Icon(size: 20,
                CupertinoIcons.refresh,
              ),
            ),
            (ForWord)
                ? IconButton(
              onPressed: () async {
                if (web != null) {
                  await web!.goForward();
                }
              },
              icon: const Icon(size: 20,
                CupertinoIcons.arrow_right,
                color: Colors.white,
              ),
            )
                : Container(),
          ],
        ),preferredSize: Size(0, 45)),

        body: Column(
          children: [
            LinearProgressIndicator(
              value: Progress,
              backgroundColor: Colors.blue,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(Url!),
                ),
                pullToRefreshController: Refresh,
                onWebViewCreated: (controller) {
                  setState(() {
                    web = controller;
                  });
                },
                onLoadStart: (controller, url) async {
                  setState(() {
                    current = url.toString();
                  });
                  ForWord = await web!.canGoForward();
                  Back = await web!.canGoBack();
                  setState(() {});
                },
                onLoadStop: (controller, url) async {
                  setState(() {
                    current = url.toString();
                  });
                  ForWord = await web!.canGoForward();
                  Back = await web!.canGoBack();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
