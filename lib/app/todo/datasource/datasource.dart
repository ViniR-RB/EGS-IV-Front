import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<dynamic>> fetchTodo();
  Future<List<dynamic>> postTodo(String title);
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

  @override
  Future<List<dynamic>> postTodo(String title) async {
    final response = await dio.post(
      'https://jsonplaceholder.typicode.com/todos',
      data: {
        'title': title,
      },
      options: Options(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    return [response.data];
  }
}
