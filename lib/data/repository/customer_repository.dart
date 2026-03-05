import 'package:isar_community/isar.dart';
import '../local/isar/collections/customer.dart';
import '../local/isar/isar_services.dart';

class CustomerRepository {
  final _isar = IsarService.instance;

  /// Add customer
  Future<void> addCustomer(Customer customer) async {
    await _isar.writeTxn(() async {
      await _isar.customers.put(customer);
    });
  }

  /// Get all customers
  Future<List<Customer>> getAllCustomers() async {
    return await _isar.customers.where().findAll();
  }

  /// Get by id
  Future<Customer?> getCustomer(int id) async {
    return await _isar.customers.get(id);
  }

  /// Delete
  Future<void> deleteCustomer(int id) async {
    await _isar.writeTxn(() async {
      await _isar.customers.delete(id);
    });
  }

  Stream<List<Customer>> watchCustomers() {
    return _isar.customers.where().watch(fireImmediately: true);
  }
}