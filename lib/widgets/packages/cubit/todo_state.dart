part of 'todo_cubit.dart';

class Todo {
  String title;
  Color color;
  bool isFinished;

  Todo({
    @required this.title,
    @required this.color,
    this.isFinished = false,
  });
}

class TodoState {
  List<Todo> todos;

  TodoState({@required this.todos});
}
