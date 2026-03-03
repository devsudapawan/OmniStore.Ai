import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'collections/customer.dart';
import 'collections/test_collection.dart';
class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        CustomerSchema
      ],
      directory: dir.path,
    );
    print("ISAR Initialized");
  }
}