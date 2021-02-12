import 'package:flutter/material.dart';

class MyListViewSeperated extends StatelessWidget {
  final List<int> items = List.generate(3, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("ListTile #$index"),
        );
      },
      itemCount: items.length,
    );
  }
}
