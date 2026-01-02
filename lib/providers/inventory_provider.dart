import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/database_service.dart';

class InventoryProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  List<Product> get lowStockProducts {
    return _products.where((p) => p.isLowStock).toList();
  }

  int get totalProducts => _products.length;

  double get inventoryValue {
    return _products.fold(0, (sum, product) => sum + (product.price * product.quantity));
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products = await DatabaseService.instance.getAllProducts();
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await DatabaseService.instance.createProduct(product);
    await loadProducts();
  }

  Future<void> updateProduct(Product product) async {
    await DatabaseService.instance.updateProduct(product);
    await loadProducts();
  }

  Future<void> deleteProduct(int id) async {
    await DatabaseService.instance.deleteProduct(id);
    await loadProducts();
  }

  Future<void> updateProductQuantity(int productId, int newQuantity) async {
    final product = _products.firstWhere((p) => p.id == productId);
    final updatedProduct = Product(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      quantity: newQuantity,
      minStockLevel: product.minStockLevel,
      category: product.category,
      createdAt: product.createdAt,
    );
    await updateProduct(updatedProduct);
  }
}
