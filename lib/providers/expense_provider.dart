import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/database_service.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  bool _isLoading = false;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;

  double get totalExpenses {
    return _expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  Map<String, double> get expensesByCategory {
    final Map<String, double> categoryTotals = {};
    for (var expense in _expenses) {
      categoryTotals[expense.category] = 
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }
    return categoryTotals;
  }

  Future<void> loadExpenses() async {
    _isLoading = true;
    notifyListeners();

    _expenses = await DatabaseService.instance.getAllExpenses();
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await DatabaseService.instance.createExpense(expense);
    await loadExpenses();
  }

  Future<void> deleteExpense(int id) async {
    await DatabaseService.instance.deleteExpense(id);
    await loadExpenses();
  }

  Future<List<Expense>> getExpensesByDateRange(DateTime start, DateTime end) async {
    return await DatabaseService.instance.getExpensesByDateRange(start, end);
  }

  List<Expense> getTodayExpenses() {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    return _expenses.where((expense) => expense.date.isAfter(startOfDay)).toList();
  }
}
