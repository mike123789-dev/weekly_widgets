import 'package:flutter/material.dart';

class Labeled extends StatelessWidget {
  String title;
  Widget child;
  Labeled({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: 30),
        child,
      ],
    );
  }
}
