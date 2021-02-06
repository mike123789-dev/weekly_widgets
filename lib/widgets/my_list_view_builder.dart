import 'package:flutter/material.dart';

class MyListViewBuilder extends StatelessWidget {
  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "ListTile #$index",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
