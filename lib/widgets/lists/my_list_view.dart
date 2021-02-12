import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry 1')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry 2')),
        ),
        Container(
          height: 50,
          color: Colors.amber[400],
          child: const Center(child: Text('Entry 3')),
        ),
        Container(
          height: 50,
          color: Colors.amber[300],
          child: const Center(child: Text('Entry 4')),
        ),
        Container(
          height: 50,
          color: Colors.amber[200],
          child: const Center(child: Text('Entry 5')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry 6')),
        ),
      ],
    );
  }
}
