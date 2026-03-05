import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../../features/business_setup/providers/business_setup_provider.dart';
import '../local/isar/collections/business.dart';
import '../local/isar/collections/category.dart';
import '../local/isar/collections/payment_method.dart';
import '../local/isar/collections/settings.dart';
import '../local/isar/isar_services.dart';


/// -------------------------------------------------------
///  BusinessRepository
///
///  Four public methods — one per loader task:
///    createBusiness()         → Task 1
///    createPaymentMethods()   → Task 2
///    createCategories()       → Task 3
///    saveSettings()           → Task 4
///
///  All writes are local Isar only.
///  syncStatus = 'pending' on every record so the
///  sync engine can push to Supabase later.
/// -------------------------------------------------------
class BusinessRepository {
  final _uuid = const Uuid();

  // Cached across the 4 sequential steps
  String? _currentBusinessId;

  // ─────────────────────────────────────────
  //  STEP 1 — Create Business
  // ─────────────────────────────────────────
  Future<String> createBusiness(BusinessSetupState state) async {
    // Never create twice
    final exists = await IsarService.businessExists();
    if (exists) {
      final existing =
      await IsarService.instance.isarBusiness.where().findFirst();
      _currentBusinessId = existing!.businessId;
      return _currentBusinessId!;
    }

    _currentBusinessId = _uuid.v4();
    final now = DateTime.now();

    final business = IsarBusiness()
      ..businessId = _currentBusinessId!
      ..businessName = state.businessName.isNotEmpty
          ? state.businessName
          : '${state.selectedStoreType?.label ?? 'My'} Store'
      ..businessType = state.selectedStoreType?.label ?? 'Other'
      ..currency = state.currency
      ..creditEnabled = state.creditEnabled
      ..defaultUnit = state.defaultUnit.label
      ..createdAt = now
      ..updatedAt = now
      ..syncStatus = 'pending';

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarBusiness.put(business);
    });

    return _currentBusinessId!;
  }

  // ─────────────────────────────────────────
  //  STEP 2 — Create Payment Methods
  // ─────────────────────────────────────────
  Future<void> createPaymentMethods(BusinessSetupState state) async {
    final businessId = await _resolveBusinessId();
    final now = DateTime.now();

    final methods = state.selectedPaymentMethods.map((method) {
      return IsarPaymentMethod()
        ..methodId = _uuid.v4()
        ..businessId = businessId
        ..name = method.label
        ..isDefault = method == PaymentMethod.cash
        ..createdAt = now
        ..syncStatus = 'pending';
    }).toList();

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarPaymentMethods.putAll(methods);
    });
  }

  // ─────────────────────────────────────────
  //  STEP 3 — Create Default Categories
  // ─────────────────────────────────────────
  Future<void> createCategories(BusinessSetupState state) async {
    final businessId = await _resolveBusinessId();
    final now = DateTime.now();
    final storeType = state.selectedStoreType ?? StoreType.grocery;

    final categories = storeType.defaultCategories.map((name) {
      return IsarCategory()
        ..categoryId = _uuid.v4()
        ..businessId = businessId
        ..name = name
        ..createdAt = now
        ..syncStatus = 'pending';
    }).toList();

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarCategorys.putAll(categories);
    });
  }

  // ─────────────────────────────────────────
  //  STEP 4 — Save Settings
  // ─────────────────────────────────────────
  Future<void> saveSettings(BusinessSetupState state) async {
    final businessId = await _resolveBusinessId();

    final settings = IsarSettings()
      ..settingsId = _uuid.v4()
      ..businessId = businessId
      ..defaultUnit = state.defaultUnit.label
      ..currency = state.currency
      ..creditEnabled = state.creditEnabled
      ..createdAt = DateTime.now()
      ..syncStatus = 'pending';

    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.isarBusiness.put(settings as IsarBusiness);
    });
  }

  // ─────────────────────────────────────────
  //  HELPERS
  // ─────────────────────────────────────────

  Future<String> _resolveBusinessId() async {
    if (_currentBusinessId != null) return _currentBusinessId!;

    final existing =
    await IsarService.instance.isarBusiness.where().findFirst();
    if (existing != null) {
      _currentBusinessId = existing.businessId;
      return _currentBusinessId!;
    }

    throw Exception(
      'BusinessRepository: no businessId found. '
          'createBusiness() must be called first.',
    );
  }

  Future<bool> businessExists() => IsarService.businessExists();

  Future<IsarBusiness?> getLocalBusiness() async =>
      IsarService.instance.isarBusiness.where().findFirst();
}