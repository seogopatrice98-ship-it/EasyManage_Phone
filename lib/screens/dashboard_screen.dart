import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/sales_provider.dart';
import '../providers/inventory_provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final salesProvider = context.watch<SalesProvider>();
    final inventoryProvider = context.watch<InventoryProvider>();
    final expenseProvider = context.watch<ExpenseProvider>();

    final currencyFormat = NumberFormat.currency(symbol: 'FCFA', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyManage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              salesProvider.loadSales();
              inventoryProvider.loadProducts();
              expenseProvider.loadExpenses();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            salesProvider.loadSales(),
            inventoryProvider.loadProducts(),
            expenseProvider.loadExpenses(),
          ]);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistiques principales
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Ventes Totales',
                      value: currencyFormat.format(salesProvider.totalSales),
                      icon: Icons.attach_money,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      title: 'Dépenses',
                      value: currencyFormat.format(expenseProvider.totalExpenses),
                      icon: Icons.trending_down,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Bénéfice Net',
                      value: currencyFormat.format(
                        salesProvider.totalSales - expenseProvider.totalExpenses,
                      ),
                      icon: Icons.account_balance,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      title: 'Produits',
                      value: '${inventoryProvider.totalProducts}',
                      icon: Icons.inventory,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Alertes stock faible
              if (inventoryProvider.lowStockProducts.isNotEmpty) ...[
                Card(
                  color: Colors.orange.shade50,
                  child: ListTile(
                    leading: Icon(Icons.warning, color: Colors.orange.shade700),
                    title: Text(
                      'Stock faible',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                      ),
                    ),
                    subtitle: Text(
                      '${inventoryProvider.lowStockProducts.length} produit(s) nécessitent un réapprovisionnement',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigation vers l'inventaire
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Ventes récentes
              Text(
                'Ventes Récentes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              if (salesProvider.sales.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(
                      child: Text('Aucune vente enregistrée'),
                    ),
                  ),
                )
              else
                ...salesProvider.sales.take(5).map((sale) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: Icon(Icons.shopping_bag, color: Colors.green.shade700),
                      ),
                      title: Text(sale.productName),
                      subtitle: Text(
                        '${sale.quantity} x ${currencyFormat.format(sale.unitPrice)}',
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            currencyFormat.format(sale.totalAmount),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yy').format(sale.date),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
