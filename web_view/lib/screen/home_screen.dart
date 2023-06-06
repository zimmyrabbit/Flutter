import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final HomeUrl = Uri.parse('https://github.com/zimmyrabbit');

class HomeScreen extends StatelessWidget {

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(HomeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('zimmyrabbit'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            controller.loadRequest(HomeUrl);
          }, icon: Icon(
            Icons.home,
          ))
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      )
      // WebView(
      //   onWebViewCreated: (WebViewController controller){
      //     this.controller = controller;
      //   },
      //   initialUrl: HomeUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      // )
    );
  }
}
