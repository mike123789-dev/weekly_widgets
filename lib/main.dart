import 'package:flutter/material.dart';
import 'package:weekly_widgets/home_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget of The Week',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(),
      ),
      home: HomeListView(),
    );
  }
}
