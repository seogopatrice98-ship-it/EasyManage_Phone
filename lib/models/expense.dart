class Expense {
  final int? id;
  final String description;
  final double amount;
  final String category;
  final DateTime date;
  final String? notes;

  Expense({
    this.id,
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }
}

// Catégories de dépenses prédéfinies
class ExpenseCategories {
  static const List<String> categories = [
    'Loyer',
    'Salaires',
    'Électricité',
    'Transport',
    'Marketing',
    'Fournitures',
    'Maintenance',
    'Autres',
  ];
}
