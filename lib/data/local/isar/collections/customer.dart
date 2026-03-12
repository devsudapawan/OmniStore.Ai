import 'package:isar_community/isar.dart';

import '../../../../core/constants/enums.dart';

part 'customer.g.dart';



@collection
class Customer {
  Id id = Isar.autoIncrement;

  /// UUID (matches Supabase)
  @Index(unique: true)
  late String customerId;

  /// owner business
  @Index()
  late String businessId;

  /// customer info
  late String name;
  String? phone;
  String? address;

  /// credit
  double? creditLimit;

  String? notes;

  /// timestamps
  late DateTime createdAt;
  late DateTime updatedAt;

  /// sync state
  @Index()
  @enumerated
  late SyncStatus syncStatus;

  /// device identifier
  late String deviceId;
}