class Product {
  final int? id;
  final String name;
  final String? description;
  final double price;
  final int quantity;
  final int minStockLevel;
  final String? category;
  final DateTime createdAt;

  Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
    this.minStockLevel = 10,
    this.category,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  bool get isLowStock => quantity <= minStockLevel;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'minStockLevel': minStockLevel,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
      minStockLevel: map['minStockLevel'] ?? 10,
      category: map['category'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
