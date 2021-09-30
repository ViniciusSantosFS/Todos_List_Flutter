// todo acesso externo vem pra ca
//Repository pattern
import 'package:app/src/Models/todo_models.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final castData = response.data as List;

    return castData.map((jsonValue) => TodoModel.fromJson(jsonValue)).toList();
  }
}
