import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/app/todo/datasource/datasource.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late DataSource dataSource;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    dataSource = DioDataSourceImpl(dio);
  });
  test('DataSource Should return List dynamic', () async {
    final response =
        Response(data: jsonResponse, requestOptions: RequestOptions());
    when(() => dio.get(any())).thenAnswer((_) async => response);
    final result = await dataSource.fetchTodo();
    expect(result, jsonResponse);
  });
}

List<dynamic> jsonResponse = [
  {'id': 1, 'title': 'Lore dsuan', 'isCompleted': true}
];
