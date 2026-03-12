import 'package:uuid/uuid.dart';

import '../../core/config/store_templates.dart';
import '../../core/constants/enums.dart';
import '../../core/device/device_service.dart';
import '../local/isar/collections/category.dart';
import '../local/isar/collections/product.dart';
import '../local/isar/isar_services.dart';

class StoreTemplateRepository {

  final _isar = IsarService.instance;
  final _uuid = const Uuid();

  Future<void> generateStoreData({
    required String businessId,
    required String storeType,
  }) async {

    final template = _getTemplate(storeType);

    if (template == null) return;

    final now = DateTime.now();

    await _isar.writeTxn(() async {

      for (final cat in template.categories) {

        final categoryId = _uuid.v4();

        final category = IsarCategory()
          ..categoryId = categoryId
          ..businessId = businessId
          ..name = cat.name
          ..createdAt = now
          ..syncStatus = SyncStatus.pending.toString();

        await _isar.isarCategorys.put(category);

        for (final prod in cat.products) {

          final product = IsarProduct()
            ..productId = _uuid.v4()
            ..businessId = businessId
            ..categoryId = categoryId
            ..name = prod.name
            ..unit = prod.unit
            ..createdAt = now
            ..isActive = true
          ..updatedAt = now

            ..syncStatus = SyncStatus.pending.toString()
      ..deviceId = DeviceService.deviceId; //

          await _isar.isarProducts.put(product);
        }
      }

    });
  }

  StoreTemplate? _getTemplate(String storeType) {

    switch (storeType) {

      case "Grocery":
        return groceryTemplate;

      default:
        return null;
    }
  }
}