import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums.dart';
import '../../core/device/device_service.dart';
import '../local/isar/collections/payment_event.dart';
import '../local/isar/isar_services.dart';

class PaymentRepository {
  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  /// Create payment event
  Future<void> createPayment({
    required String businessId,
    required String transactionId,
    required String methodId,
    required double amount,
    String? note,
  }) async {

    final payment = IsarPaymentEvent()
      ..paymentEventId = _uuid.v4()
      ..businessId = businessId
      ..transactionId = transactionId
      ..methodId = methodId
      ..amount = amount
      ..note = note
      ..createdAt = DateTime.now()
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.isarPaymentEvents.put(payment);
    });
  }

  /// get payments for transaction
  Future<List<IsarPaymentEvent>> getPayments(String transactionId) async {

    return _isar.isarPaymentEvents
        .filter()
        .transactionIdEqualTo(transactionId)
        .findAll();
  }

  /// watch payments
  Stream<List<IsarPaymentEvent>> watchPayments(String transactionId) {

    return _isar.isarPaymentEvents
        .filter()
        .transactionIdEqualTo(transactionId)
        .watch(fireImmediately: true);
  }
}