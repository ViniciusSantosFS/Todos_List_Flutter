// @dart=2.9

import 'dart:convert';
import 'package:app/src/mocks/fake_list.dart';
import 'package:app/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final repository = TodoRepository(dio);

  test("Trazer lista de todos", () async {
    final fakeData = dataList();

    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(fakeData)));

    final list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}
