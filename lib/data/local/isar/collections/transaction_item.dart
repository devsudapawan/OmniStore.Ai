import 'package:isar_community/isar.dart';

import '../../../../core/constants/enums.dart';

part 'transaction_item.g.dart';



@collection
class IsarTransactionItem {
  Id id = Isar.autoIncrement;

  /// UUID
  @Index(unique: true)
  late String itemId;

  /// parent transaction
  @Index()
  late String transactionId;

  /// product
  @Index()
  late String productId;

  /// quantity
  late double quantity;

  /// price per unit
  late double price;

  /// total
  late double subtotal;

  /// timestamps
  late DateTime createdAt;

  /// sync state
  @Index()
  @enumerated
  late SyncStatus syncStatus;

  /// device id
  late String deviceId;
}