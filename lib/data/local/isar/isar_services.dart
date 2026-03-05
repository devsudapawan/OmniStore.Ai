// import 'package:isar_community/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'collections/customer.dart';
// import 'collections/test_collection.dart';
// class IsarService {
//   static late Isar isar;
//
//   static Future<void> init() async {
//     final dir = await getApplicationDocumentsDirectory();
//
//     isar = await Isar.open(
//       [
//         CustomerSchema
//       ],
//       directory: dir.path,
//     );
//     print("ISAR Initialized");
//   }
// }

import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/business.dart';
import 'collections/category.dart';
import 'collections/payment_method.dart';
import 'collections/settings.dart';

// Add future collections here:
// import 'collections/customer.dart';
// import 'collections/product.dart';

class IsarService {
  IsarService._();

  static Isar? _isar;

  static Isar get instance {
    assert(
    _isar != null,
    'IsarService.init() must be called before accessing instance',
    );
    return _isar!;
  }

  static Future<void> init() async {
    if (_isar != null && _isar!.isOpen) return;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        IsarBusinessSchema,
        IsarCategorySchema,
        IsarPaymentMethodSchema,
        IsarSettingsSchema,
        // IsarCustomerSchema,
      ],
      directory: dir.path,
      name: 'omnistore_db',
    );
  }

  static Future<bool> businessExists() async {
    final count = await instance.isarBusiness.count();
    return count > 0;
  }

  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}