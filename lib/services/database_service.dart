import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/sale.dart';
import '../models/product.dart';
import '../models/expense.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('easymanage.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';
    const realType = 'REAL NOT NULL';

    // Table des ventes
    await db.execute('''
      CREATE TABLE sales (
        id $idType,
        productName $textType,
        quantity $intType,
        unitPrice $realType,
        totalAmount $realType,
        date $textType,
        notes TEXT
      )
    ''');

    // Table des produits
    await db.execute('''
      CREATE TABLE products (
        id $idType,
        name $textType,
        description TEXT,
        price $realType,
        quantity $intType,
        minStockLevel INTEGER DEFAULT 10,
        category TEXT,
        createdAt $textType
      )
    ''');

    // Table des dépenses
    await db.execute('''
      CREATE TABLE expenses (
        id $idType,
        description $textType,
        amount $realType,
        category $textType,
        date $textType,
        notes TEXT
      )
    ''');
  }

  // ====== VENTES ======
  Future<int> createSale(Sale sale) async {
    final db = await database;
    return await db.insert('sales', sale.toMap());
  }

  Future<List<Sale>> getAllSales() async {
    final db = await database;
    final result = await db.query('sales', orderBy: 'date DESC');
    return result.map((json) => Sale.fromMap(json)).toList();
  }

  Future<List<Sale>> getSalesByDateRange(DateTime start, DateTime end) async {
    final db = await database;
    final result = await db.query(
      'sales',
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'date DESC',
    );
    return result.map((json) => Sale.fromMap(json)).toList();
  }

  Future<double> getTotalSales() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(totalAmount) as total FROM sales');
    return result.first['total'] as double? ?? 0.0;
  }

  // ====== PRODUITS ======
  Future<int> createProduct(Product product) async {
    final db = await database;
    return await db.insert('products', product.toMap());
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final result = await db.query('products', orderBy: 'name ASC');
    return result.map((json) => Product.fromMap(json)).toList();
  }

  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Product>> getLowStockProducts() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM products WHERE quantity <= minStockLevel ORDER BY quantity ASC'
    );
    return result.map((json) => Product.fromMap(json)).toList();
  }

  // ====== DÉPENSES ======
  Future<int> createExpense(Expense expense) async {
    final db = await database;
    return await db.insert('expenses', expense.toMap());
  }

  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    final result = await db.query('expenses', orderBy: 'date DESC');
    return result.map((json) => Expense.fromMap(json)).toList();
  }

  Future<List<Expense>> getExpensesByDateRange(DateTime start, DateTime end) async {
    final db = await database;
    final result = await db.query(
      'expenses',
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'date DESC',
    );
    return result.map((json) => Expense.fromMap(json)).toList();
  }

  Future<double> getTotalExpenses() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(amount) as total FROM expenses');
    return result.first['total'] as double? ?? 0.0;
  }

  Future<int> deleteExpense(int id) async {
    final db = await database;
    return await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
