class Sale {
  final int? id;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double totalAmount;
  final DateTime date;
  final String? notes;

  Sale({
    this.id,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalAmount,
    required this.date,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalAmount': totalAmount,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id'],
      productName: map['productName'],
      quantity: map['quantity'],
      unitPrice: map['unitPrice'],
      totalAmount: map['totalAmount'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }
}
