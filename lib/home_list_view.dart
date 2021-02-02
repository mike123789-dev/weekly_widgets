import 'package:flutter/material.dart';
import 'package:weekly_widgets/deatil_view.dart';
import 'package:weekly_widgets/my_widget.dart';

class HomeListView extends StatelessWidget {
  final List<MyWidget> myWidgets = [
    MyWidget(widgetName: "Text", widget: Text("SAMPLE")),
    MyWidget(widgetName: "Button", widget: RaisedButton(onPressed: () {}))
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
      appBar: AppBar(
        title: Text('Widgets of The Week'),
      ),
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
