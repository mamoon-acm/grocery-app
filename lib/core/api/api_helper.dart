import 'package:grocery_app/core/network/dio_client.dart';
import 'package:grocery_app/core/constant/api_constants.dart';

class ApiHelper {
  final DioClient _dioClient;

  ApiHelper({DioClient? dioClient}) : _dioClient = dioClient ?? DioClient();

  /// Fetch all grocery items
  Future<List<dynamic>> getGroceries() async {
    try {
      final response = await _dioClient.get(ApiConstants.getAllGroceries);
      return response as List<dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
