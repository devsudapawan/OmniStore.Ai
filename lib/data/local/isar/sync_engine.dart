import 'dart:async';

import 'package:isar_community/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants/enums.dart';
import 'collections/business.dart' hide SyncStatus;
import 'collections/category.dart';
import 'collections/customer.dart';
import 'collections/inventory_event.dart';
import 'collections/payment_event.dart';
import 'collections/payment_method.dart';
import 'collections/product.dart';
import 'collections/transaction.dart';
import 'collections/transaction_item.dart';
import 'isar_services.dart';

class SyncEngine {
  final _supabase = Supabase.instance.client;
  final _isar = IsarService.instance;

  Timer? _timer;

  /// start periodic sync
  void start() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 20),
          (_) => syncAll(),
    );
  }

  /// stop sync
  void stop() {
    _timer?.cancel();
  }

  /// master sync
  Future<void> syncAll() async {
    await _syncBusinesses();
    await _syncCategories();
    await _syncProducts();
    await _syncCustomers();
    await _syncTransactions();
    await _syncTransactionItems();
    await _syncInventoryEvents();
    await _syncPaymentMethods();
    await _syncPaymentEvents();
  }

  /// -------------------------
  /// BUSINESS
  /// -------------------------
  Future<void> _syncBusinesses() async {

    final list = await _isar.isarBusiness
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final b in list) {
      try {

        await _supabase.from('businesses').upsert({
          "id": b.businessId,
          "store_name": b.businessName,
          "store_type": b.businessType,
        });

        await _isar.writeTxn(() async {
          b.syncStatus =SyncStatus.synced;
          await _isar.isarBusiness.put(b);
        });

      } catch (e) {
        print("Business sync failed $e");
      }
    }
  }

  /// -------------------------
  /// CATEGORY
  /// -------------------------
  Future<void> _syncCategories() async {

    final list = await _isar.isarCategorys
        .filter()
        .syncStatusEqualTo("pending")
        .findAll();

    for (final c in list) {

      try {

        await _supabase.from('categories').upsert({
          "id": c.categoryId,
          "business_id": c.businessId,
          "name": c.name,
        });

        await _isar.writeTxn(() async {
          c.syncStatus = "synced";
          await _isar.isarCategorys.put(c);
        });

      } catch (e) {
        print("Category sync error $e");
      }
    }
  }

  /// -------------------------
  /// PRODUCT
  /// -------------------------
  Future<void> _syncProducts() async {

    final list = await _isar.isarProducts
        .filter()
        .syncStatusEqualTo("pending")
        .findAll();

    for (final p in list) {

      try {

        await _supabase.from('products').upsert({
          "id": p.productId,
          "business_id": p.businessId,
          "category_id": p.categoryId,
          "name": p.name,
          "unit": p.unit,
          "selling_price": p.sellingPrice,
        });

        await _isar.writeTxn(() async {
          p.syncStatus = "synced";
          await _isar.isarProducts.put(p);
        });

      } catch (e) {
        print("Product sync error $e");
      }
    }
  }

  /// -------------------------
  /// CUSTOMER
  /// -------------------------
  Future<void> _syncCustomers() async {

    final list = await _isar.customers
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final c in list) {

      try {

        await _supabase.from('customers').upsert({
          "id": c.id,
          "name": c.name,
          "phone": c.phone,
          "address": c.address,
        });

        await _isar.writeTxn(() async {
          c.syncStatus = SyncStatus.synced;
          await _isar.customers.put(c);
        });

      } catch (e) {
        print("Customer sync error $e");
      }
    }
  }

  /// -------------------------
  /// TRANSACTIONS
  /// -------------------------
  Future<void> _syncTransactions() async {

    final list = await _isar.isarTransactions
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final t in list) {

      try {

        await _supabase.from('transactions').upsert({
          "id": t.transactionId,
          "business_id": t.businessId,
          "customer_id": t.customerId,
          "total_amount": t.totalAmount,
        });

        await _isar.writeTxn(() async {
          t.syncStatus = SyncStatus.synced;
          await _isar.isarTransactions.put(t);
        });

      } catch (e) {
        print("Transaction sync error $e");
      }
    }
  }

  /// -------------------------
  /// TRANSACTION ITEMS
  /// -------------------------
  Future<void> _syncTransactionItems() async {

    final list = await _isar.isarTransactionItems
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final i in list) {

      try {

        await _supabase.from('transaction_items').upsert({
          "id": i.itemId,
          "transaction_id": i.transactionId,
          "product_id": i.productId,
          "quantity": i.quantity,
          "price": i.price,
        });

        await _isar.writeTxn(() async {
          i.syncStatus = SyncStatus.synced;
          await _isar.isarTransactionItems.put(i);
        });

      } catch (e) {
        print("Item sync error $e");
      }
    }
  }

  /// -------------------------
  /// INVENTORY EVENTS
  /// -------------------------
  Future<void> _syncInventoryEvents() async {

    final list = await _isar.isarInventoryEvents
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final e in list) {

      try {

        await _supabase.from('inventory_events').upsert({
          "id": e.eventId,
          "product_id": e.productId,
          "quantity": e.quantity,
          "event_type": e.type.name,
        });

        await _isar.writeTxn(() async {
          e.syncStatus = SyncStatus.synced;
          await _isar.isarInventoryEvents.put(e);
        });

      } catch (err) {
        print("Inventory event sync error $err");
      }
    }
  }

  /// -------------------------
  /// PAYMENT METHODS
  /// -------------------------
  Future<void> _syncPaymentMethods() async {

    final list = await _isar.isarPaymentMethods
        .filter()
        .syncStatusEqualTo("pending")
        .findAll();

    for (final m in list) {

      try {

        await _supabase.from('payment_methods').upsert({
          "id": m.methodId,
          "business_id": m.businessId,
          "name": m.name,
        });

        await _isar.writeTxn(() async {
          m.syncStatus = "synced";
          await _isar.isarPaymentMethods.put(m);
        });

      } catch (e) {
        print("Payment method sync error $e");
      }
    }
  }

  /// -------------------------
  /// PAYMENT EVENTS
  /// -------------------------
  Future<void> _syncPaymentEvents() async {

    final list = await _isar.isarPaymentEvents
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();

    for (final p in list) {

      try {

        await _supabase.from('payment_events').upsert({
          "id": p.paymentEventId,
          "transaction_id": p.transactionId,
          "method_id": p.methodId,
          "amount": p.amount,
        });

        await _isar.writeTxn(() async {
          p.syncStatus = SyncStatus.synced;
          await _isar.isarPaymentEvents.put(p);
        });

      } catch (e) {
        print("Payment sync error $e");
      }
    }
  }
}