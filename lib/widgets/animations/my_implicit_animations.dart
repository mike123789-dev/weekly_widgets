import 'package:flutter/material.dart';

class MyImplicitAnimations extends StatefulWidget {
  @override
  _MyImplicitAnimationsState createState() => _MyImplicitAnimationsState();
}

class _MyImplicitAnimationsState extends State<MyImplicitAnimations>
    with TickerProviderStateMixin {
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.red);

  bool isFocused = false;
  bool isValid = false;
  void initState() {
    super.initState();
  }

  OutlineInputBorder borderMaker(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTweenAnimationBuilder(),
        SizedBox(
          height: 30,
        ),
        buildAnimatedSize(),
        SizedBox(
          height: 30,
        ),
        buildAnimatedContainer(),
      ],
    );
  }

  TweenAnimationBuilder<Color> buildTweenAnimationBuilder() {
    return TweenAnimationBuilder(
      tween: colorTween,
      child: FlutterLogo(
        size: 50,
      ),
      duration: Duration(seconds: 5),
      builder: (_, Color color, Widget myChild) {
        return ColorFiltered(
          child: myChild,
          colorFilter: ColorFilter.mode(color, BlendMode.modulate),
        );
      },
    );
  }

  AnimatedContainer buildAnimatedContainer() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: isValid ? Colors.green : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print("hi");
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 10.0,
          ),
          child: Text('Let\'s go'),
        ),
      ),
    );
  }

  AnimatedSize buildAnimatedSize() {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: isFocused ? double.infinity : 150,
          child: Focus(
            onFocusChange: (value) {
              setState(() {
                isFocused = value;
              });
            },
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  isValid = value.length != 0;
                });
              },
              decoration: InputDecoration(
                border: borderMaker(Colors.green),
                labelText: "Username",
                hintText: "A unique username",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
