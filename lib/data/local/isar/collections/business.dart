

import 'package:isar_community/isar.dart';
part 'business.g.dart';
@collection
class IsarBusiness {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String businessId; // UUID string

  late String businessName;
  late String businessType;
  late String currency;
  late bool creditEnabled;
  late String defaultUnit;

  late DateTime createdAt;
  late DateTime updatedAt;

  /// 'pending' | 'synced' | 'failed'
  @Index()
  late String syncStatus;
}