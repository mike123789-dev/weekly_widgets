import 'package:flutter/material.dart';

class MyFirstButtons extends StatefulWidget {
  @override
  _MyFirstButtonsState createState() => _MyFirstButtonsState();
}

class _MyFirstButtonsState extends State<MyFirstButtons> {
  Icon starIcon = Icon(Icons.star);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("ElevatedButton"),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: starIcon,
            label: Text("ElevatedButton.icon"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("TextButton"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: starIcon,
            label: Text("ElevatedButton.icon"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("OutlinedButton"),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: starIcon,
            label: Text("ElevatedButton.icon"),
          ),
          IconButton(
            onPressed: () {},
            icon: starIcon,
          ),
        ],
      ),
    );
  }
}
