// @dart=2.9

import 'package:app/src/Controllers/home_controller.dart';
import 'package:app/src/Models/todo_models.dart';
import 'package:app/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final reposository = TodoRepositoryMock();
  final controller = HomeController(reposository);

  test("Preencher variavel todos", () async {
    when(reposository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    expect(controller.state, HomeState.start);

    await controller.start();

    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });

  test("Change state to error if request fails", () async {
    when(reposository.fetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.start);

    await controller.start();

    expect(controller.state, HomeState.error);
  });
}
