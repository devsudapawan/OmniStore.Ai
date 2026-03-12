import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums.dart';
import '../../core/device/device_service.dart';
import '../local/isar/collections/transaction_item.dart';
import '../local/isar/isar_services.dart';

class TransactionItemRepository {
  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  /// Create item
  Future<void> createItem({
    required String transactionId,
    required String productId,
    required double quantity,
    required double price,
  }) async {

    final item = IsarTransactionItem()
      ..itemId = _uuid.v4()
      ..transactionId = transactionId
      ..productId = productId
      ..quantity = quantity
      ..price = price
      ..subtotal = quantity * price
      ..createdAt = DateTime.now()
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.isarTransactionItems.put(item);
    });
  }

  /// Get items of transaction
  Future<List<IsarTransactionItem>> getItems(String transactionId) async {
    return _isar.isarTransactionItems
        .filter()
        .transactionIdEqualTo(transactionId)
        .findAll();
  }

  /// Watch items
  Stream<List<IsarTransactionItem>> watchItems(String transactionId) {
    return _isar.isarTransactionItems
        .filter()
        .transactionIdEqualTo(transactionId)
        .watch(fireImmediately: true);
  }
}