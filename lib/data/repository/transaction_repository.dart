import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';
import '../../core/constants/enums.dart' hide TransactionType;
import '../../core/device/device_service.dart';
import '../local/isar/collections/transaction.dart';
import '../local/isar/isar_services.dart';

class TransactionRepository {
  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  /// Create transaction
  Future<String> createTransaction({
    required String businessId,
    String? customerId,
    required TransactionType type,
    double? totalAmount,
    String? note,
  }) async {

    final now = DateTime.now();

    final txn = IsarTransaction()
      ..transactionId = _uuid.v4()
      ..businessId = businessId
      ..customerId = customerId
      ..type = type
      ..totalAmount = totalAmount
      ..note = note
      ..createdAt = now
      ..updatedAt = now
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.isarTransactions.put(txn);
    });

    return txn.transactionId;
  }

  /// Get transactions
  Future<List<IsarTransaction>> getTransactions(String businessId) async {
    return _isar.isarTransactions
        .filter()
        .businessIdEqualTo(businessId)
        .findAll();
  }

  /// Watch transactions (realtime UI)
  Stream<List<IsarTransaction>> watchTransactions(String businessId) {
    return _isar.isarTransactions
        .filter()
        .businessIdEqualTo(businessId)
        .watch(fireImmediately: true);
  }
}