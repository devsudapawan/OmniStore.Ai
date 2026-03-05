import 'package:isar_community/isar.dart';

part 'settings.g.dart';

@Collection()
class IsarSettings {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String settingsId;

  @Index(unique: true)
  late String businessId;

  late String defaultUnit;
  late String currency;
  late bool creditEnabled;
  late DateTime createdAt;

  @Index()
  late String syncStatus;
}