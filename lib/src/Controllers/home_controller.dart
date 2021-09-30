import 'package:app/src/Models/todo_models.dart';
import 'package:app/src/repositories/todo_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (error) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
