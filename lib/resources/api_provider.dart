import 'package:dio/dio.dart';
import 'package:counter_app/models/binary_model.dart';

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
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error');
        print(e.message);
      }
    }
    return binarymodel;
  }
}
