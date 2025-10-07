import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  Future<void> executeWithLoading<T>(
    Future<T> Function() operation, {
    void Function(T)? onSuccess,
    void Function(String)? onError,
  }) async {
    try {
      setLoading(true);
      clearError();

      final result = await operation();
      onSuccess?.call(result);
    } catch (e) {
      final errorMessage = e.toString();
      setError(errorMessage);
      onError?.call(errorMessage);
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
