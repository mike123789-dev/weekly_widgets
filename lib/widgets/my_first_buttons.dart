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
            label: Text("TextButton.icon"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("OutlinedButton"),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: starIcon,
            label: Text("OutlinedButton.icon"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: starIcon,
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: starIcon,
                iconSize: 40,
              ),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: starIcon,
                  iconSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          "Title Text",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "This is a Card widget to show how to use ButtonBar",
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("TextButton"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("ElevatedButton"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
