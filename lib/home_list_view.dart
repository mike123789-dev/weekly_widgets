import 'package:flutter/material.dart';
import 'package:weekly_widgets/deatil_view.dart';
import 'package:weekly_widgets/my_widget.dart';
import 'package:weekly_widgets/widgets/animations/my_animated_switcher.dart';
import 'package:weekly_widgets/widgets/lists/my_checkbox_list_tile.dart';
import 'package:weekly_widgets/widgets/animations/my_container_transform.dart';
import 'package:weekly_widgets/widgets/animations/my_fade_through.dart';
import 'package:weekly_widgets/widgets/my_first_buttons.dart';
import 'package:weekly_widgets/widgets/lists/my_list_tile.dart';
import 'package:weekly_widgets/widgets/lists/my_list_view.dart';
import 'package:weekly_widgets/widgets/lists/my_list_view_builder.dart';
import 'package:weekly_widgets/widgets/lists/my_list_view_with_different_items.dart';
import 'package:weekly_widgets/widgets/lists/my_lists.dart';
import 'package:weekly_widgets/widgets/lists/my_list_view_seperated.dart';
import 'package:weekly_widgets/widgets/my_padding.dart';
import 'package:weekly_widgets/widgets/my_second_buttons.dart';
import 'package:weekly_widgets/widgets/animations/my_shared_axis.dart';
import 'package:weekly_widgets/widgets/my_slider.dart';
import 'package:weekly_widgets/widgets/my_text_field.dart';

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

  final List<MyWidget> myWidgets = [
    MyWidget(
      widgetName: "TextField",
      widget: MyTextField(),
    ),
    MyWidget(
      widgetName: "Padding",
      widget: MyPadding(),
    ),
    MyWidget(
      widgetName: "Slider",
      widget: MySlider(),
    ),
    MyWidget(
      widgetName: "Buttons",
      widget: MyFirstButtons(),
    ),
    MyWidget(
      widgetName: "Buttons more",
      widget: MySecondButtons(),
    ),
    MyWidget(
      widgetName: "Lists",
      widget: MyLists(),
    ),
    MyWidget(
      widgetName: "ListView",
      widget: MyListView(),
    ),
    MyWidget(
      widgetName: "ListView.builder",
      widget: MyListViewBuilder(),
    ),
    MyWidget(
      widgetName: 'ListView.separated',
      widget: MyListViewSeperated(),
    ),
    MyWidget(
      widgetName: "ListView.Builder with Different Items",
      widget: MyListViewWithDifferentItems(),
    ),
    MyWidget(
      widgetName: "ListTile",
      widget: MyListTile(),
    ),
    MyWidget(
      widgetName: "CheckBoxTile",
      widget: MyCheckBoxTile(),
    ),
    MyWidget(
      widgetName: "ContainerTransform",
      widget: MyContainerTransform(),
    ),
    MyWidget(
      widgetName: "SharedAxis",
      widget: MySharedAxis(),
    ),
    MyWidget(
      widgetName: "FadeThrough",
      widget: MyFadeThrough(),
    ),
    MyWidget(
      widgetName: "AnimatedSwitcher",
      widget: MyAniamtedSwitcher(),
    )
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
          controller: _scrollController,
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              title: Text(
                "${myWidgets[i].widgetName}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                _pushDetailScreen(context, i);
              },
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
