import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(TodoState(todos: [
          Todo(title: "Something", color: Colors.green),
          Todo(title: "Another", color: Colors.red),
          Todo(title: "What?", color: Colors.blue),
        ]));

  void add({String title, Color color}) {
    final newTodo = Todo(title: title, color: color);
    state.todos.add(newTodo);
    return emit(TodoState(todos: state.todos));
  }

  void toggle(int index) {
    state.todos[index].isFinished = !state.todos[index].isFinished;
    return emit(TodoState(todos: state.todos));
  }

  void remove(int index) {
    state.todos.removeAt(index);
    return emit(TodoState(todos: state.todos));
  }
}
