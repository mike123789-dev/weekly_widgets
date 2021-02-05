import 'package:flutter/material.dart';
import 'package:weekly_widgets/deatil_view.dart';
import 'package:weekly_widgets/my_widget.dart';
import 'package:weekly_widgets/widgets/my_first_buttons.dart';
import 'package:weekly_widgets/widgets/my_padding.dart';
import 'package:weekly_widgets/widgets/my_second_buttons.dart';
import 'package:weekly_widgets/widgets/my_slider.dart';
import 'package:weekly_widgets/widgets/my_text_field.dart';

class HomeListView extends StatelessWidget {
  final List<MyWidget> myWidgets = [
    MyWidget(widgetName: "TextField", widget: MyTextField()),
    MyWidget(widgetName: "Padding", widget: MyPadding()),
    MyWidget(widgetName: "Slider", widget: MySlider()),
    MyWidget(widgetName: "Buttons", widget: MyFirstButtons()),
    MyWidget(widgetName: "Buttons more", widget: MySecondButtons())
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
