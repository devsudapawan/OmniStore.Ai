import 'package:isar_community/isar.dart';

import '../../../../core/constants/enums.dart';

part 'inventory_event.g.dart';

enum InventoryEventType {
  purchase,
  sale,
  returnEvent,
  damage,
  adjustment,
  initial,
}



@collection
class IsarInventoryEvent {
  Id id = Isar.autoIncrement;

  /// UUID
  @Index(unique: true)
  late String eventId;

  /// business
  @Index()
  late String businessId;

  /// product
  @Index()
  late String productId;

  /// optional reference (transaction)
  String? referenceId;

  /// event type
  @enumerated
  late InventoryEventType type;

  /// quantity (+ or -)
  late double quantity;

  /// optional reason
  String? reason;

  /// timestamps
  late DateTime createdAt;

  /// sync state
  @Index()
  @enumerated
  late SyncStatus syncStatus;

  /// device id
  late String deviceId;
}