import 'package:flutter/material.dart';
import 'package:weekly_widgets/deatil_view.dart';
import 'package:weekly_widgets/my_widget.dart';
import 'package:weekly_widgets/widgets/my_first_buttons.dart';
import 'package:weekly_widgets/widgets/my_layout_builder.dart';
import 'package:weekly_widgets/widgets/my_media_query.dart';
import 'package:weekly_widgets/widgets/my_padding.dart';
import 'package:weekly_widgets/widgets/my_second_buttons.dart';
import 'package:weekly_widgets/widgets/my_slider.dart';
import 'package:weekly_widgets/widgets/my_stack.dart';
import 'package:weekly_widgets/widgets/my_text_field.dart';
import 'package:weekly_widgets/widgets/packages/my_image_picker.dart';
import 'widgets/animations/animations.dart';
import 'widgets/lists/lists.dart';
import 'widgets/packages/packages.dart';

abstract class HomeListItem {
  Widget buildTitle(BuildContext context);
}

class HeaderItem implements HomeListItem {
  final String title;
  HeaderItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetItem implements HomeListItem {
  final MyWidget myWidget;

  WidgetItem(this.myWidget);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      myWidget.widgetName,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

class HomeListView extends StatefulWidget {
  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<HomeListItem> myWidgets = [
    HeaderItem("Widgets"),
    WidgetItem(
      MyWidget(widgetName: "TextField", widget: MyTextField()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Padding", widget: MyPadding()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Slider", widget: MySlider()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Buttons", widget: MyFirstButtons()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Buttons more", widget: MySecondButtons()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Stack", widget: MyStack()),
    ),
    WidgetItem(
      MyWidget(widgetName: "MediaQuery", widget: MyMediaQuery()),
    ),
    WidgetItem(
      MyWidget(widgetName: "LayoutBuilder", widget: MyLayoutBuilder()),
    ),
    HeaderItem("Lists"),
    WidgetItem(
      MyWidget(widgetName: "ListView", widget: MyListView()),
    ),
    WidgetItem(
      MyWidget(widgetName: "ListView.builder", widget: MyListViewBuilder()),
    ),
    WidgetItem(
      MyWidget(widgetName: 'ListView.separated', widget: MyListViewSeperated()),
    ),
    WidgetItem(
      MyWidget(
          widgetName: "ListView.Builder with Different Items",
          widget: MyListViewWithDifferentItems()),
    ),
    WidgetItem(
      MyWidget(widgetName: "ListTile", widget: MyListTile()),
    ),
    WidgetItem(
      MyWidget(widgetName: "CheckBoxTile", widget: MyCheckBoxTile()),
    ),
    HeaderItem("Animations"),
    WidgetItem(
      MyWidget(
          widgetName: "ContainerTransform", widget: MyContainerTransform()),
    ),
    WidgetItem(
      MyWidget(widgetName: "SharedAxis", widget: MySharedAxis()),
    ),
    WidgetItem(
      MyWidget(widgetName: "FadeThrough", widget: MyFadeThrough()),
    ),
    WidgetItem(
      MyWidget(widgetName: "AnimatedSwitcher", widget: MyAniamtedSwitcher()),
    ),
    HeaderItem("Packages"),
    WidgetItem(
      MyWidget(widgetName: "Bloc", widget: MyBloc()),
    ),
    WidgetItem(
      MyWidget(widgetName: "ImagePicker", widget: MyImagePicker()),
    ),
    WidgetItem(
      MyWidget(widgetName: "ImageGallerySaver", widget: MyGallerySaver()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Sqflite", widget: MySqflite()),
    ),
    WidgetItem(
      MyWidget(widgetName: "Ad", widget: MyAd()),
    ),
  ];

  void _pushDetailScreen(BuildContext context, HomeListItem item) {
    if (item is WidgetItem) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailView(
            myWidget: item.myWidget,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets of The Week'),
      ),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int i) {
            final item = myWidgets[i];
            return ListTile(
              title: item.buildTitle(context),
              onTap: (item is WidgetItem)
                  ? () {
                      _pushDetailScreen(context, item);
                    }
                  : null,
            );
          },
          itemCount: myWidgets.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        },
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
