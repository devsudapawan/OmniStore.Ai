//
// import 'package:get_storage/get_storage.dart';
//
// class AppLocalStorage {
//   static final AppLocalStorage _instance = AppLocalStorage._internal();
//   factory AppLocalStorage(){
//     return _instance;
//   }
//
//
//   AppLocalStorage._internal();
//   final storage = GetStorage();
// // Generic method to save data
//   Future<void> saveData<T>(String key, T value) async { await storage.write(key, value);
//
//   }
// // Generic method to read data
//   T? readData<T>(String key) { return storage.read<T>(key);
//   }
// // Generic method to remove data
// Future<void> removeData(String key) async {
//     await storage.remove(key);
// }
//
//
//   Future<void> clearAll() async {
//     await storage.erase();
//   }
//
// }