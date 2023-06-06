import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final HomeUrl = 'https://github.com/zimmyrabbit';

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
            // http://
            // https://
            if(controller == null) return;
            controller!.loadUrl(HomeUrl);
          }, icon: Icon(
            Icons.home,
          ))
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller){
          this.controller = controller;
        },
        initialUrl: HomeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
