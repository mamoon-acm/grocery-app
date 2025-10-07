import 'package:grocery_app/model/grocery_item.dart';
import 'package:grocery_app/service/grocery_service.dart';
import 'package:grocery_app/view_model/base_view_model.dart';
import 'package:grocery_app/core/exception/app_exceptions.dart';

class HomeViewmodel extends BaseViewModel {
  final GroceryService _groceryService = GroceryService();
  List<Product> _groceryItems = [];
  String _errorMessage = '';

  List<Product> get groceryItems => _groceryItems;
  String get errorMessage => _errorMessage;

  HomeViewmodel() {
    loadGroceryItems();
  }

  Future<void> loadGroceryItems() async {
    setLoading(true);
    _errorMessage = '';
    try {
      _groceryItems = await _groceryService.fetchGroceryItems();
      notifyListeners();
    } on AppException catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } catch (e) {
      _errorMessage = 'An unexpected error occurred: $e';
      notifyListeners();
    } finally {
      setLoading(false);
    }
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
