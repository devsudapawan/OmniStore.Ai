import 'package:isar_community/isar.dart';

import '../../../../core/constants/enums.dart';

part 'transaction.g.dart';

enum TransactionType {
  sale,
  payment,
  returnTxn,
  adjustment,
}



@collection
class IsarTransaction {
  Id id = Isar.autoIncrement;

  /// UUID
  @Index(unique: true)
  late String transactionId;

  /// owner business
  @Index()
  late String businessId;

  /// optional customer (walk-in allowed)
  String? customerId;

  /// sale / payment
  @enumerated
  late TransactionType type;

  /// total amount
  double? totalAmount;

  /// optional notes
  String? note;

  /// timestamps
  late DateTime createdAt;
  late DateTime updatedAt;

  /// sync state
  @Index()
  @enumerated
  late SyncStatus syncStatus;

  /// device id
  late String deviceId;
}