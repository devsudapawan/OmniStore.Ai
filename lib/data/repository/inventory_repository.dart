import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums.dart' hide InventoryEventType;
import '../../core/device/device_service.dart';
import '../local/isar/collections/inventory_event.dart';
import '../local/isar/isar_services.dart';

class InventoryRepository {
  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  /// create event
  Future<void> createEvent({
    required String businessId,
    required String productId,
    required InventoryEventType type,
    required double quantity,
    String? referenceId,
    String? reason,
  }) async {

    final event = IsarInventoryEvent()
      ..eventId = _uuid.v4()
      ..businessId = businessId
      ..productId = productId
      ..type = type
      ..quantity = quantity
      ..referenceId = referenceId
      ..reason = reason
      ..createdAt = DateTime.now()
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.isarInventoryEvents.put(event);
    });
  }

  /// get product stock
  Future<double> getProductStock(String productId) async {

    final events = await _isar.isarInventoryEvents
        .filter()
        .productIdEqualTo(productId)
        .findAll();

    double stock = 0;

    for (final e in events) {
      stock += e.quantity;
    }

    return stock;
  }

  /// watch product stock
  Stream<double> watchStock(String productId) {

    return _isar.isarInventoryEvents
        .filter()
        .productIdEqualTo(productId)
        .watch(fireImmediately: true)
        .map((events) {

      double stock = 0;

      for (final e in events) {
        stock += e.quantity;
      }

      return stock;

    });
  }
}