import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/customer_provider.dart';
import '../../../data/local/isar/collections/customer.dart';
import 'add_customer_screen.dart';

final customersStreamProvider =
StreamProvider<List<Customer>>((ref) async* {
  final repo = ref.read(customerRepositoryProvider);

  // TODO: later get this from BusinessRepository
  const businessId = "local_business";

  yield* repo.watchCustomers(businessId);
});

class CustomerListScreen extends ConsumerWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customersStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Customers")),
      body: customers.when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text("No customers"));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final c = list[index];

              return ListTile(
                title: Text(c.name),
                subtitle: Text(c.phone ?? ""),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddCustomerScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}