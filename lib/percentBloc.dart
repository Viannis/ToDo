import 'dart:async';
import 'todo.dart';
import 'todo_todo.dart';

class PercentBloc {
  List<ToDoToDo> toDoToDo;

  final _todoList = StreamController<List<ToDoToDo>>();

  final _todoPercent = StreamController<ToDos>();

  Stream<List<ToDoToDo>> get todoListStream => _todoList.stream;

  StreamSink<List<ToDoToDo>> get todoListSink => _todoList.sink;

  StreamSink<ToDos> get todoPercentage => _todoPercent.sink;

  PercentBloc(){
    _todoList.add(this.toDoToDo);

    _todoPercent.stream.listen(_getPercent);
  }

  _getPercent(ToDos toDos){
    int count1 = 0;
    double percent;
    if(toDos.todoList.length == 0){
      return 0.0;
    }
    else{
      for(int i = 0;i<toDos.todoList.length;i++){
      count1 += toDos.todoList[i].count;
    }
    percent = count1.toDouble() / toDos.todoList.length.toDouble();
    
    // return percent;
    }

    todoListSink.add(toDos.todoList);
  }

}