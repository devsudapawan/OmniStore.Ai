import 'package:isar_community/isar.dart';

part 'product.g.dart';

@collection
class IsarProduct {
  Id id = Isar.autoIncrement;

  /// UUID (matches Supabase later)
  @Index(unique: true)
  late String productId;

  /// Business owner
  @Index()
  late String businessId;

  /// Category
  @Index()
  late String categoryId;

  /// Product info
  late String name;

  String? sku;
  String? barcode;

  /// Unit
  late String unit; // kg, pcs, liter

  /// Pricing
  double? sellingPrice;
  double? purchasePrice;

  /// Active / archived
  late bool isActive;

  /// timestamps
  late DateTime createdAt;
  late DateTime updatedAt;

  /// device for sync
  late String deviceId;

  /// pending / synced / failed
  @Index()
  late String syncStatus;
}