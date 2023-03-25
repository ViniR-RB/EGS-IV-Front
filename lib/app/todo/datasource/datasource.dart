import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<dynamic>> fetchTodo();
}

class DioDataSourceImpl implements DataSource {
  Dio dio;

  DioDataSourceImpl(this.dio);

  @override
  Future<List<dynamic>> fetchTodo() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');
    return response.data as List<dynamic>;
  }
}
