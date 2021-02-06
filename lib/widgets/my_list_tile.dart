import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: [
        Card(
          child: ListTile(
            title: Text(
              "ListTile",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "ListTile with leading",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: Icon(Icons.star),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "ListTile with trailing",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: Icon(Icons.star),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "2lined ListTile",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              "This is the subtitle",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "2lined ListTile",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              "This is the subtitle",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "2lined ListTile",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              "This is the subtitle",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            leading: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}
