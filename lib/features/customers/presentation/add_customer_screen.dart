import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/providers/customer_provider.dart';

class AddCustomerScreen extends ConsumerStatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  ConsumerState<AddCustomerScreen> createState() =>
      _AddCustomerScreenState();
}

class _AddCustomerScreenState extends ConsumerState<AddCustomerScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _saveCustomer() async {
    final repo = ref.read(customerRepositoryProvider);

    const businessId = "local_business";

    await repo.createCustomer(
      businessId: businessId,
      name: _nameController.text,
      phone: _phoneController.text,
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Customer")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveCustomer,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}