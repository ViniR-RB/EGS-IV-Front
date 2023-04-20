import 'package:dio/dio.dart';
import 'package:front/app/core/configuration/configuration.dart';

abstract class DataSource {
  Future<List<dynamic>> fetchTodo();
  Future<List<dynamic>> postTodo(String title);
}

class DioDataSourceImpl implements DataSource {
  Dio dio;

  DioDataSourceImpl(this.dio);

  @override
  Future<List<dynamic>> fetchTodo() async {
    final response = await dio.get('${ConfigurateEnv.baseUrl}/todos/');
    return response.data as List<dynamic>;
  }

  @override
  Future<List<dynamic>> postTodo(String title) async {
    final response = await dio.post(
      '${ConfigurateEnv.baseUrl}/todo/',
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
