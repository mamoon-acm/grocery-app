import 'package:grocery_app/core/api/api_helper.dart';
import 'package:grocery_app/core/exception/app_exceptions.dart';
import 'package:grocery_app/model/grocery_item.dart';

class GroceryRepository {
  final ApiHelper _apiHelper;

  GroceryRepository({ApiHelper? apiHelper})
    : _apiHelper = apiHelper ?? ApiHelper();

  /// Fetch all grocery items
  Future<List<Product>> getGroceries() async {
    try {
      final response = await _apiHelper.getGroceries();
      return response
          .map<Product>(
            (item) => Product.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException('Failed to fetch groceries: $e');
    }
  }
}
