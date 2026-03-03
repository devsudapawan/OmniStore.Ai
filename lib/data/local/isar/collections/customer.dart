import 'package:isar_community/isar.dart';

part 'customer.g.dart';

enum SyncStatus {
  pending,
  synced,
  failed,
}

@collection
class Customer {
  Id id = Isar.autoIncrement;

  late String name;
  String? phone;
  String? address;

  double? creditLimit;
  String? notes;

  late DateTime createdAt;
  late DateTime updatedAt;

  @Index()
  @enumerated
  late SyncStatus syncStatus;

  late String deviceId;
}