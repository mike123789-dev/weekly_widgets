import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MySharedAxis extends StatefulWidget {
  @override
  _MySharedAxisState createState() => _MySharedAxisState();
}

class _MySharedAxisState extends State<MySharedAxis> {
  bool _onFirstPage = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: _onFirstPage == true
                    ? null
                    : () {
                        setState(() {
                          _onFirstPage = true;
                        });
                      },
                child: Text(
                  "First Page",
                  style: TextStyle(
                      color: _onFirstPage == true
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.blue),
                ),
              ),
              FlatButton(
                  onPressed: _onFirstPage == false
                      ? null
                      : () {
                          setState(() {
                            _onFirstPage = false;
                          });
                        },
                  child: Text(
                    "Second Page",
                    style: TextStyle(
                      color: _onFirstPage == false
                          ? Colors.red.withOpacity(0.5)
                          : Colors.red,
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            // reverse: !_onFirstPage,
            transitionBuilder: (Widget child, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
              );
            },
            child: _onFirstPage
                ? Container(
                    key: UniqueKey(),
                    color: Colors.blue,
                    child: Center(
                      child: Text("FIRST PAGE"),
                    ),
                  )
                : Container(
                    key: UniqueKey(),
                    color: Colors.red,
                    child: Center(
                      child: Text("SECOND PAGE"),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
