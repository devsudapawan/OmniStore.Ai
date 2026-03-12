import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../features/business_setup/providers/business_setup_provider.dart';
import '../../features/pos/model/cart_item.dart';
import '../local/isar/isar_services.dart';
import '../local/isar/collections/transaction.dart';
import '../local/isar/collections/transaction_item.dart';
import '../local/isar/collections/inventory_event.dart';
import '../local/isar/collections/payment_event.dart';
import '../../core/device/device_service.dart';
import '../../core/constants/enums.dart' hide InventoryEventType;

class PosRepository {
  final _uuid = const Uuid();

  Future<void> createSale({
    required String businessId,
    required String? customerId,
    required List<CartItem> items,
    required PaymentMethod paymentMethod,
    required double totalAmount,
  }) async {

    final isar = IsarService.instance;

    final now = DateTime.now();
    final deviceId = DeviceService.deviceId;

    final transactionId = _uuid.v4();

    await isar.writeTxn(() async {

      /// 1️⃣ Create Transaction
      final transaction = IsarTransaction()
        ..transactionId = transactionId
        ..businessId = businessId
        ..customerId = customerId
        ..totalAmount = totalAmount
        ..createdAt = now
        ..deviceId = deviceId
        ..syncStatus = SyncStatus.pending;

      await isar.isarTransactions.put(transaction);


      /// 2️⃣ Create Transaction Items
      final itemsList = items.map((cart) {
        return IsarTransactionItem()
          ..itemId = _uuid.v4()
          ..transactionId = transactionId
          ..productId = cart.productId
          ..quantity = cart.quantity.toDouble()
          ..price = cart.price
          ..createdAt = now
          ..deviceId = deviceId
          ..syncStatus = SyncStatus.pending;
      }).toList();

      await isar.isarTransactionItems.putAll(itemsList);


      /// 3️⃣ Create Inventory Events
      final inventoryEvents = items.map((cart) {
        return IsarInventoryEvent()
          ..eventId = _uuid.v4()
          ..productId = cart.productId
          ..businessId = businessId
          ..type = InventoryEventType.sale
          ..quantity = -cart.quantity.toDouble()
          ..createdAt = now
          ..deviceId = deviceId
          ..syncStatus = SyncStatus.pending;
      }).toList();

      await isar.isarInventoryEvents.putAll(inventoryEvents);


      /// 4️⃣ Create Payment Event
      final payment = IsarPaymentEvent()
        ..paymentEventId = _uuid.v4()
        ..transactionId = transactionId
        ..amount = totalAmount
        ..methodId = paymentMethod.name
        ..createdAt = now
        ..deviceId = deviceId
        ..syncStatus = SyncStatus.pending;

      await isar.isarPaymentEvents.put(payment);
    });
  }
}