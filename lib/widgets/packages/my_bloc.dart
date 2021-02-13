import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_widgets/widgets/packages/cubit/todo_cubit.dart';

class MyBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Stack(
          children: [
            TodoListView(),
            AddButton(),
          ],
          alignment: AlignmentDirectional.bottomEnd,
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final List<Color> _colors = [
    Colors.black,
    Colors.green,
    Colors.blueGrey,
    Colors.red[300],
    Colors.blue[100],
    Colors.pink[200],
    Colors.yellow
  ];

  AddButton({Key key}) : super(key: key);

  Color _getRandomColor() {
    final random = Random();
    return _colors[random.nextInt(_colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      bottom: 30,
      child: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TodoCubit>(context)
              .add(title: "NEW", color: _getRandomColor());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoListView extends StatelessWidget {
  const TodoListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        print(state);
        print(state.todos.length);
        if (state is TodoState) {
          if (state.todos.isEmpty) {
            return Center(
              child: Text("Add a Todo!"),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, i) {
                final todo = state.todos[i];
                return Dismissible(
                  key: UniqueKey(),
                  child: CheckboxListTile(
                    secondary: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: todo.color,
                          radius: 10,
                        ),
                      ],
                    ),
                    value: todo.isFinished,
                    onChanged: (_) {
                      context.read<TodoCubit>().toggle(i);
                    },
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    switch (direction) {
                      case DismissDirection.startToEnd:
                        print("green");
                        break;
                      case DismissDirection.endToStart:
                        print("red");
                        context.read<TodoCubit>().remove(i);
                        break;
                      default:
                    }
                  },
                  dragStartBehavior: DragStartBehavior.start,
                  movementDuration: Duration(milliseconds: 300),
                  background: Container(
                    color: Colors.green,
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.todos.length,
              separatorBuilder: (context, i) {
                return Divider(
                  height: 1.5,
                );
              },
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
