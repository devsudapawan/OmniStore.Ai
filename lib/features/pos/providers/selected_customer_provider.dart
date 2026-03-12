import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCustomer {
  final String? id;
  final String name;

  const SelectedCustomer({
    this.id,
    required this.name,
  });
}

final selectedCustomerProvider =
StateProvider<SelectedCustomer>(
      (ref) => const SelectedCustomer(
    id: null,
    name: "Walk-in Customer",
  ),
);