import 'package:isar_community/isar.dart';

import '../../../../core/constants/enums.dart';

part 'payment_event.g.dart';



@collection
class IsarPaymentEvent {
  Id id = Isar.autoIncrement;

  /// UUID
  @Index(unique: true)
  late String paymentEventId;

  /// business
  @Index()
  late String businessId;

  /// transaction reference
  @Index()
  late String transactionId;

  /// payment method
  @Index()
  late String methodId;

  /// payment amount
  late double amount;

  /// optional note
  String? note;

  /// timestamps
  late DateTime createdAt;

  /// sync state
  @Index()
  @enumerated
  late SyncStatus syncStatus;

  /// device id
  late String deviceId;
}