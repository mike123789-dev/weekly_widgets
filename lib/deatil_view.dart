import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:weekly_widgets/my_widget.dart';

class DetailView extends StatelessWidget {
  final MyWidget myWidget;
  DetailView({this.myWidget});

  void _showWebView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return SafeArea(child: WebView(initialUrl: "https://m.naver.com"));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${myWidget.widgetName}"),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // _showWebView(context);
              })
        ],
      ),
      body: Center(child: myWidget.widget),
    );
  }
}
