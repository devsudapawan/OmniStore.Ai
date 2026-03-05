import 'package:isar_community/isar.dart';

part 'payment_method.g.dart';

@Collection()
class IsarPaymentMethod {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String methodId;

  @Index()
  late String businessId;

  late String name;
  late bool isDefault;
  late DateTime createdAt;

  @Index()
  late String syncStatus;
}