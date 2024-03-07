import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResumeView extends StatelessWidget {
  ResumeView({Key? key}) : super(key: key);

  // Create a webview controller
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}