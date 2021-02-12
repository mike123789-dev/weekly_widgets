import 'package:flutter/material.dart';

class MyAniamtedSwitcher extends StatefulWidget {
  MyAniamtedSwitcher({Key key}) : super(key: key);

  @override
  _MyAniamtedSwitcherState createState() => _MyAniamtedSwitcherState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyAniamtedSwitcherState extends State<MyAniamtedSwitcher> {
  List<Widget> _widgets = [
    Text("A Text"),
    Container(
      height: 100,
      width: 150,
      color: Colors.blue[100],
      child: Text("A Container"),
    ),
    IconButton(
      icon: Icon(Icons.gamepad_outlined),
      onPressed: () {},
    ),
  ];

  int _count = 0;
  int _currentIndex = 0;

  void switchWidget() {
    setState(() {
      _currentIndex += 1;
      if (_currentIndex == _widgets.length) {
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_count',
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        ElevatedButton(
          child: const Text('Animate Same Widget'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
        SizedBox(
          height: 100,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(child: child, opacity: animation);
          },
          child: _widgets[_currentIndex],
          switchInCurve: Curves.easeInOut,
        ),
        ElevatedButton(
          child: const Text('Animate Different Widget'),
          onPressed: switchWidget,
        ),
      ],
    );
  }
}
