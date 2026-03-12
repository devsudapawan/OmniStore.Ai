import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums.dart';
import '../../core/device/device_service.dart';
import '../local/isar/collections/customer.dart';
import '../local/isar/isar_services.dart';

class CustomerRepository {
  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  /// --------------------------------------------------
  /// CREATE CUSTOMER
  /// --------------------------------------------------
  Future<void> createCustomer({
    required String businessId,
    required String name,
    String? phone,
    String? address,
    double? creditLimit,
    String? notes,
  }) async {
    final now = DateTime.now();

    final customer = Customer()
      ..customerId = _uuid.v4()
      ..businessId = businessId
      ..name = name
      ..phone = phone
      ..address = address
      ..creditLimit = creditLimit
      ..notes = notes
      ..createdAt = now
      ..updatedAt = now
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.customers.put(customer);
    });
  }

  /// --------------------------------------------------
  /// GET CUSTOMERS (BY BUSINESS)
  /// --------------------------------------------------
  Future<List<Customer>> getCustomers(String businessId) async {
    return _isar.customers
        .filter()
        .businessIdEqualTo(businessId)
        .findAll();
  }

  /// --------------------------------------------------
  /// UPDATE CUSTOMER
  /// --------------------------------------------------
  Future<void> updateCustomer(Customer customer) async {
    customer.updatedAt = DateTime.now();
    customer.syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.customers.put(customer);
    });
  }

  /// --------------------------------------------------
  /// DELETE CUSTOMER
  /// --------------------------------------------------
  Future<void> deleteCustomer(Customer customer) async {
    await _isar.writeTxn(() async {
      await _isar.customers.delete(customer.id);
    });
  }

  /// --------------------------------------------------
  /// WATCH CUSTOMERS (REALTIME UI)
  /// --------------------------------------------------
  Stream<List<Customer>> watchCustomers(String businessId) {
    return _isar.customers
        .filter()
        .businessIdEqualTo(businessId)
        .watch(fireImmediately: true);
  }

  /// --------------------------------------------------
  /// GET SINGLE CUSTOMER
  /// --------------------------------------------------
  Future<Customer?> getCustomerById(String customerId) async {
    return _isar.customers
        .filter()
        .customerIdEqualTo(customerId)
        .findFirst();
  }
}