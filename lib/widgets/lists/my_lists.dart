import 'package:flutter/material.dart';

import '../../deatil_view.dart';
import '../../my_widget.dart';

class MyLists extends StatelessWidget {
  final List<MyWidget> myWidgets = [
    MyWidget(widgetName: "Text", widget: Text("ssss")),
  ];

  void _pushDetailScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailView(
          myWidget: myWidgets[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              title: Text("${myWidgets[i].widgetName}"),
              onTap: () {
                _pushDetailScreen(context, i);
              },
            );
          },
          itemCount: myWidgets.length,
        ),
      ),
    );
  }
}
