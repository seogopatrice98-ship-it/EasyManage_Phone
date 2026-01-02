import 'package:flutter/material.dart';
import '../models/sale.dart';
import '../services/database_service.dart';

class SalesProvider with ChangeNotifier {
  List<Sale> _sales = [];
  bool _isLoading = false;

  List<Sale> get sales => _sales;
  bool get isLoading => _isLoading;

  double get totalSales {
    return _sales.fold(0, (sum, sale) => sum + sale.totalAmount);
  }

  Future<void> loadSales() async {
    _isLoading = true;
    notifyListeners();

    _sales = await DatabaseService.instance.getAllSales();
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addSale(Sale sale) async {
    await DatabaseService.instance.createSale(sale);
    await loadSales();
  }

  Future<List<Sale>> getSalesByDateRange(DateTime start, DateTime end) async {
    return await DatabaseService.instance.getSalesByDateRange(start, end);
  }

  List<Sale> getTodaySales() {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    return _sales.where((sale) => sale.date.isAfter(startOfDay)).toList();
  }
}
