import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BankPage extends StatelessWidget {
  BankPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(body: buildContent);
  }

  Widget get buildContent {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("Web response ${request.url}");
            if (request.url == "https://hyzmat.tmcell.tm/") {
              Navigator.pop(context);
            }
            // if (request.url.startsWith('https://tmcell.tm/')) {

            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://tmcell.tm/'));
    return WebViewWidget(controller: controller);
  }
}
