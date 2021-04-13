import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _pageController = PageController();

  void previous() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutBack,
    );
  }

  void next() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutBack,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                  color: Colors.pink[100],
                ),
                Container(
                  color: Colors.cyan[100],
                ),
                Container(
                  color: Colors.deepPurple[100],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: previous,
                child: Text("left"),
              ),
              TextButton(
                onPressed: next,
                child: Text("right"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
