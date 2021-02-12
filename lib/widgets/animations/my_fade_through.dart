import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyFadeThrough extends StatefulWidget {
  @override
  _MyFadeThroughState createState() => _MyFadeThroughState();
}

class _MyFadeThroughState extends State<MyFadeThrough> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Container(key: UniqueKey(), color: Colors.red),
    Container(key: UniqueKey(), color: Colors.blue),
    Container(key: UniqueKey(), color: Colors.green)
  ];

  void buttonPressed() {
    setState(() {
      if (pageIndex == 0) {
        pageIndex = 1;
      } else if (pageIndex == 1) {
        pageIndex = 2;
      } else {
        pageIndex = 0;
      }
      print(pageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: buttonPressed,
          child: Text("change"),
        ),
        Expanded(
          child: PageTransitionSwitcher(
            transitionBuilder: (Widget child, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: pageList[pageIndex],
            duration: Duration(milliseconds: 100),
          ),
        )
      ],
    );
  }
}
