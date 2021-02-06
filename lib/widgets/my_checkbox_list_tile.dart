import 'package:flutter/material.dart';

class MyCheckBoxTile extends StatefulWidget {
  @override
  _MyCheckBoxTileState createState() => _MyCheckBoxTileState();
}

class ToDo {
  String title;
  bool isFinished;
  ToDo(this.title, this.isFinished);
}

class _MyCheckBoxTileState extends State<MyCheckBoxTile> {
  final List<ToDo> _todos = List.generate(
    10,
    (index) => ToDo("Todo #$index", false),
  );

  void _toggle(index) {
    setState(() {
      _todos[index].isFinished = !_todos[index].isFinished;
    });
  }

  void _addTodo() {
    final newTodo = ToDo("Todo #${_todos.length}", false);
    setState(() {
      _todos.add(newTodo);
    });
  }

  void _removeTodo(index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final todoItem = _todos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: CheckboxListTile(
                    secondary: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        _removeTodo(index);
                      },
                      color: Theme.of(context).errorColor,
                    ),
                    value: todoItem.isFinished,
                    title: Text(
                      todoItem.title,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    onChanged: (_) {
                      _toggle(index);
                    },
                    // checkColor: Colors.red,
                    activeColor: Colors.green,
                  ),
                ),
              );
            },
            itemCount: _todos.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: ElevatedButton(
            onPressed: _addTodo,
            child: Text("Add New Todo"),
          ),
        )
      ],
    );
  }
}
