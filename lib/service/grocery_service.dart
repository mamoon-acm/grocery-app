import 'package:grocery_app/model/grocery_item.dart';
import 'package:grocery_app/core/repository/grocery_repository.dart';

class GroceryService {
  final GroceryRepository _repository = GroceryRepository();

  Future<List<Product>> fetchGroceryItems() async {
    try {
      return await _repository.getGroceries();
    } catch (e) {
      rethrow;
    }
  }
 
 
 
}
