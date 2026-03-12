import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/enums.dart';
import '../../core/device/device_service.dart';
import '../local/isar/collections/product.dart';
import '../local/isar/isar_services.dart';

class ProductRepository {
  final _uuid = const Uuid();

  /// -------------------------------------------------------
  /// Create Product
  /// -------------------------------------------------------
  Future<void> createProduct({
    required String businessId,
    required String categoryId,
    required String name,
    required String unit,
    double? sellingPrice,
    double? purchasePrice,
    String? barcode,
    String? sku,
  }) async {
    final now = DateTime.now();

    final product = IsarProduct()
      ..productId = _uuid.v4()
      ..businessId = businessId
      ..categoryId = categoryId
      ..name = name
      ..unit = unit
      ..sellingPrice = sellingPrice
      ..purchasePrice = purchasePrice
      ..barcode = barcode
      ..sku = sku
      ..isActive = true
      ..createdAt = now
      ..updatedAt = now
      ..deviceId = DeviceService.deviceId //
      ..syncStatus = SyncStatus.pending.toString();

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarProducts.put(product);
    });
  }

  /// -------------------------------------------------------
  /// Get Products
  /// -------------------------------------------------------
  Future<List<IsarProduct>> getProducts(String businessId) async {
    return IsarService.instance.isarProducts
        .filter()
        .businessIdEqualTo(businessId)
        .isActiveEqualTo(true)
        .findAll();
  }

  /// -------------------------------------------------------
  /// Update Product
  /// -------------------------------------------------------
  Future<void> updateProduct(IsarProduct product) async {
    product.updatedAt = DateTime.now();
    product.syncStatus = 'pending';

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarProducts.put(product);
    });
  }

  /// -------------------------------------------------------
  /// Soft Delete Product
  /// -------------------------------------------------------
  Future<void> deleteProduct(IsarProduct product) async {
    product.isActive = false;
    product.updatedAt = DateTime.now();
    product.syncStatus = 'pending';

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarProducts.put(product);
    });
  }

  /// -------------------------------------------------------
  /// Stream Products (Realtime UI)
  /// -------------------------------------------------------
  Stream<List<IsarProduct>> watchProducts(String businessId) {
    return IsarService.instance.isarProducts
        .filter()
        .businessIdEqualTo(businessId)
        .isActiveEqualTo(true)
        .watch(fireImmediately: true);
  }
}