import 'package:flutter/material.dart';
import 'package:weekly_widgets/widgets/reusable_widgets/labeled.dart';

class MySecondButtons extends StatefulWidget {
  @override
  _MySecondButtonsState createState() => _MySecondButtonsState();
}

enum MenuType { first, second, third }

extension ParseToString on MenuType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

class _MySecondButtonsState extends State<MySecondButtons> {
  List<bool> _selections = List.generate(3, (index) => false);
  MenuType _dropdownValue;
  MenuType _selection;

  @override
  void initState() {
    super.initState();
    _dropdownValue = MenuType.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Labeled(
          title: "ToggleButtons",
          child: ToggleButtons(
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.call),
              Text("WIFI"),
            ],
            onPressed: (int index) {
              setState(() {
                _selections[index] = !_selections[index];
              });
            },
            isSelected: _selections,
          ),
        ),
        Labeled(
          title: "DropdownButton",
          child: DropdownButton(
            value: _dropdownValue,
            items: MenuType.values
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.toShortString()),
                    ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                _dropdownValue = newValue;
              });
            },
            elevation: 4,
          ),
        ),
        Labeled(
          title: "PopupMenuButton",
          child: PopupMenuButton<MenuType>(
            icon: Icon(Icons.settings),
            onSelected: (MenuType result) {
              setState(() {
                _selection = result;
              });
            },
            itemBuilder: (BuildContext context) => MenuType.values
                .map((value) => PopupMenuItem(
                      value: value,
                      child: Text(value.toShortString()),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
