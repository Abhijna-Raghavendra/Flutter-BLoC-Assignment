import 'package:dio/dio.dart';
import 'package:counter_app/models/binary_model.dart';

String errorMessage = '';

class ApiProvider {
  final Dio _dio = Dio();

  Future<BinaryModel?> fetchBinaryList({required int number}) async {
    BinaryModel? binarymodel;
    try {
      Response response = await _dio
          .get('https://networkcalc.com/api/binary/$number?from=10&to=2');
      BinaryModel data = BinaryModel.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      if (e.response != null) {
        errorMessage = 'Dio error!\n'
            'STATUS: ${e.response?.statusCode}\n'
            'DATA: ${e.response?.data}\n'
            'HEADERS: ${e.response?.headers}';
      } else {
        errorMessage = 'Error\n'
            '${e.message}';
      }
    }
    return binarymodel;
  }
}
