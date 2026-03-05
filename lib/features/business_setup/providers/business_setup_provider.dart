// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // ─────────────────────────────────────────────────────
// //  MODELS
// // ─────────────────────────────────────────────────────
//
// enum StoreType {
//   grocery,
//   dairy,
//   medical,
//   electronics,
//   clothing,
//   restaurant,
//   other,
// }
//
// extension StoreTypeExt on StoreType {
//   String get label {
//     switch (this) {
//       case StoreType.grocery:     return 'Grocery';
//       case StoreType.dairy:       return 'Dairy';
//       case StoreType.medical:     return 'Medical';
//       case StoreType.electronics: return 'Electronics';
//       case StoreType.clothing:    return 'Clothing';
//       case StoreType.restaurant:  return 'Restaurant';
//       case StoreType.other:       return 'Other';
//     }
//   }
//
//   String get emoji {
//     switch (this) {
//       case StoreType.grocery:     return '🛒';
//       case StoreType.dairy:       return '🥛';
//       case StoreType.medical:     return '💊';
//       case StoreType.electronics: return '📱';
//       case StoreType.clothing:    return '👕';
//       case StoreType.restaurant:  return '🍽️';
//       case StoreType.other:       return '🏪';
//     }
//   }
//
//   /// Default categories created during setup
//   List<String> get defaultCategories {
//     switch (this) {
//       case StoreType.grocery:
//         return ['Rice', 'Flour', 'Snacks', 'Dairy', 'Oil', 'Beverages'];
//       case StoreType.dairy:
//         return ['Milk', 'Curd', 'Paneer', 'Butter', 'Ghee', 'Cheese'];
//       case StoreType.medical:
//         return ['Tablets', 'Syrups', 'Injections', 'Vitamins', 'Skin Care', 'Baby Care'];
//       case StoreType.electronics:
//         return ['Mobile', 'Accessories', 'Cables', 'Batteries', 'Bulbs', 'Fans'];
//       case StoreType.clothing:
//         return ['Shirts', 'Pants', 'Sarees', 'Kids Wear', 'Innerwear', 'Accessories'];
//       case StoreType.restaurant:
//         return ['Starters', 'Main Course', 'Beverages', 'Desserts', 'Combos', 'Extras'];
//       case StoreType.other:
//         return ['Category 1', 'Category 2', 'Category 3'];
//     }
//   }
// }
//
// enum PaymentMethod { cash, upi, card }
//
// extension PaymentMethodExt on PaymentMethod {
//   String get label {
//     switch (this) {
//       case PaymentMethod.cash: return 'Cash';
//       case PaymentMethod.upi:  return 'UPI';
//       case PaymentMethod.card: return 'Card';
//     }
//   }
//
//   String get emoji {
//     switch (this) {
//       case PaymentMethod.cash: return '💵';
//       case PaymentMethod.upi:  return '📲';
//       case PaymentMethod.card: return '💳';
//     }
//   }
// }
//
// enum StockUnit { kg, pcs, liters }
//
// extension StockUnitExt on StockUnit {
//   String get label {
//     switch (this) {
//       case StockUnit.kg:     return 'kg';
//       case StockUnit.pcs:   return 'pcs';
//       case StockUnit.liters: return 'liters';
//     }
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  STATE
// // ─────────────────────────────────────────────────────
//
// class BusinessSetupState {
//   final StoreType? selectedStoreType;
//   final bool creditEnabled;
//   final Set<PaymentMethod> selectedPaymentMethods;
//   final StockUnit defaultUnit;
//   final String currency;
//   final String businessName;
//
//   const BusinessSetupState({
//     this.selectedStoreType,
//     this.creditEnabled = true,
//     this.selectedPaymentMethods = const {PaymentMethod.cash, PaymentMethod.upi},
//     this.defaultUnit = StockUnit.pcs,
//     this.currency = '₹ INR',
//     this.businessName = '',
//   });
//
//   BusinessSetupState copyWith({
//     StoreType? selectedStoreType,
//     bool? creditEnabled,
//     Set<PaymentMethod>? selectedPaymentMethods,
//     StockUnit? defaultUnit,
//     String? currency,
//     String? businessName,
//   }) {
//     return BusinessSetupState(
//       selectedStoreType: selectedStoreType ?? this.selectedStoreType,
//       creditEnabled: creditEnabled ?? this.creditEnabled,
//       selectedPaymentMethods:
//           selectedPaymentMethods ?? this.selectedPaymentMethods,
//       defaultUnit: defaultUnit ?? this.defaultUnit,
//       currency: currency ?? this.currency,
//       businessName: businessName ?? this.businessName,
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  NOTIFIER
// // ─────────────────────────────────────────────────────
//
// class BusinessSetupNotifier extends StateNotifier<BusinessSetupState> {
//   BusinessSetupNotifier() : super(const BusinessSetupState());
//
//   void selectStoreType(StoreType type) {
//     state = state.copyWith(selectedStoreType: type);
//   }
//
//   void setCreditEnabled(bool value) {
//     state = state.copyWith(creditEnabled: value);
//   }
//
//   void togglePaymentMethod(PaymentMethod method) {
//     final current = Set<PaymentMethod>.from(state.selectedPaymentMethods);
//     if (current.contains(method)) {
//       // Always keep at least one
//       if (current.length > 1) current.remove(method);
//     } else {
//       current.add(method);
//     }
//     state = state.copyWith(selectedPaymentMethods: current);
//   }
//
//   void setUnit(StockUnit unit) {
//     state = state.copyWith(defaultUnit: unit);
//   }
//
//   void setBusinessName(String name) {
//     state = state.copyWith(businessName: name);
//   }
//
//   void reset() {
//     state = const BusinessSetupState();
//   }
// }
//
// // ─────────────────────────────────────────────────────
// //  PROVIDER
// // ─────────────────────────────────────────────────────
//
// final businessSetupProvider =
//     StateNotifierProvider<BusinessSetupNotifier, BusinessSetupState>(
//   (ref) => BusinessSetupNotifier(),
// );

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Update this path to match your project structure ──
import '../../../data/repository/business_repository.dart';

// ─────────────────────────────────────────────────────
//  ENUMS & EXTENSIONS
// ─────────────────────────────────────────────────────

enum StoreType {
  grocery,
  dairy,
  medical,
  electronics,
  clothing,
  restaurant,
  other,
}

extension StoreTypeExt on StoreType {
  String get label {
    switch (this) {
      case StoreType.grocery:     return 'Grocery';
      case StoreType.dairy:       return 'Dairy';
      case StoreType.medical:     return 'Medical';
      case StoreType.electronics: return 'Electronics';
      case StoreType.clothing:    return 'Clothing';
      case StoreType.restaurant:  return 'Restaurant';
      case StoreType.other:       return 'Other';
    }
  }

  String get emoji {
    switch (this) {
      case StoreType.grocery:     return '🛒';
      case StoreType.dairy:       return '🥛';
      case StoreType.medical:     return '💊';
      case StoreType.electronics: return '📱';
      case StoreType.clothing:    return '👕';
      case StoreType.restaurant:  return '🍽️';
      case StoreType.other:       return '🏪';
    }
  }

  List<String> get defaultCategories {
    switch (this) {
      case StoreType.grocery:
        return ['Rice', 'Flour', 'Snacks', 'Dairy', 'Oil', 'Beverages'];
      case StoreType.dairy:
        return ['Milk', 'Curd', 'Paneer', 'Butter', 'Ghee', 'Cheese'];
      case StoreType.medical:
        return ['Tablets', 'Syrups', 'Injections', 'Vitamins', 'Skin Care', 'Baby Care'];
      case StoreType.electronics:
        return ['Mobile', 'Accessories', 'Cables', 'Batteries', 'Bulbs', 'Fans'];
      case StoreType.clothing:
        return ['Shirts', 'Pants', 'Sarees', 'Kids Wear', 'Innerwear', 'Accessories'];
      case StoreType.restaurant:
        return ['Starters', 'Main Course', 'Beverages', 'Desserts', 'Combos', 'Extras'];
      case StoreType.other:
        return ['Category 1', 'Category 2', 'Category 3'];
    }
  }
}

enum PaymentMethod { cash, upi, card }

extension PaymentMethodExt on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.cash: return 'Cash';
      case PaymentMethod.upi:  return 'UPI';
      case PaymentMethod.card: return 'Card';
    }
  }

  String get emoji {
    switch (this) {
      case PaymentMethod.cash: return '💵';
      case PaymentMethod.upi:  return '📲';
      case PaymentMethod.card: return '💳';
    }
  }
}

enum StockUnit { kg, pcs, liters }

extension StockUnitExt on StockUnit {
  String get label {
    switch (this) {
      case StockUnit.kg:      return 'kg';
      case StockUnit.pcs:     return 'pcs';
      case StockUnit.liters:  return 'liters';
    }
  }
}

// ─────────────────────────────────────────────────────
//  SETUP STATUS
// ─────────────────────────────────────────────────────

enum SetupStatus { idle, loading, success, error }

// ─────────────────────────────────────────────────────
//  STATE
// ─────────────────────────────────────────────────────

class BusinessSetupState {
  final StoreType? selectedStoreType;
  final bool creditEnabled;
  final Set<PaymentMethod> selectedPaymentMethods;
  final StockUnit defaultUnit;
  final String currency;
  final String businessName;
  final SetupStatus setupStatus;
  final String? errorMessage;
  final int completedSteps; // 0–4

  const BusinessSetupState({
    this.selectedStoreType,
    this.creditEnabled = true,
    this.selectedPaymentMethods = const {PaymentMethod.cash, PaymentMethod.upi},
    this.defaultUnit = StockUnit.pcs,
    this.currency = '₹ INR',
    this.businessName = '',
    this.setupStatus = SetupStatus.idle,
    this.errorMessage,
    this.completedSteps = 0,
  });

  BusinessSetupState copyWith({
    StoreType? selectedStoreType,
    bool? creditEnabled,
    Set<PaymentMethod>? selectedPaymentMethods,
    StockUnit? defaultUnit,
    String? currency,
    String? businessName,
    SetupStatus? setupStatus,
    String? errorMessage,
    int? completedSteps,
  }) {
    return BusinessSetupState(
      selectedStoreType: selectedStoreType ?? this.selectedStoreType,
      creditEnabled: creditEnabled ?? this.creditEnabled,
      selectedPaymentMethods:
      selectedPaymentMethods ?? this.selectedPaymentMethods,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      currency: currency ?? this.currency,
      businessName: businessName ?? this.businessName,
      setupStatus: setupStatus ?? this.setupStatus,
      errorMessage: errorMessage,
      completedSteps: completedSteps ?? this.completedSteps,
    );
  }
}

// ─────────────────────────────────────────────────────
//  NOTIFIER
// ─────────────────────────────────────────────────────

class BusinessSetupNotifier extends StateNotifier<BusinessSetupState> {
  BusinessSetupNotifier() : super(const BusinessSetupState());

  final _repository = BusinessRepository();

  // ── Answer setters (called from UI) ──

  void selectStoreType(StoreType type) =>
      state = state.copyWith(selectedStoreType: type);

  void setCreditEnabled(bool value) =>
      state = state.copyWith(creditEnabled: value);

  void togglePaymentMethod(PaymentMethod method) {
    final current = Set<PaymentMethod>.from(state.selectedPaymentMethods);
    if (current.contains(method)) {
      if (current.length > 1) current.remove(method);
    } else {
      current.add(method);
    }
    state = state.copyWith(selectedPaymentMethods: current);
  }

  void setUnit(StockUnit unit) =>
      state = state.copyWith(defaultUnit: unit);

  void setBusinessName(String name) =>
      state = state.copyWith(businessName: name);

  void reset() => state = const BusinessSetupState();

  // ── Internal step tracker ──
  void _markStep(int step) =>
      state = state.copyWith(completedSteps: step);

  // ─────────────────────────────────────────
  //  COMPLETE BUSINESS SETUP
  //  Called once by SetupLoaderScreen.
  //  Updates completedSteps after each step so
  //  the loader UI can tick tasks off in real time.
  // ─────────────────────────────────────────
  Future<void> completeBusinessSetup() async {
    state = state.copyWith(
      setupStatus: SetupStatus.loading,
      completedSteps: 0,
      errorMessage: null,
    );

    try {
      // Step 1
      await _repository.createBusiness(state);
      _markStep(1);

      // Step 2
      await _repository.createPaymentMethods(state);
      _markStep(2);

      // Step 3
      await _repository.createCategories(state);
      _markStep(3);

      // Step 4
      await _repository.saveSettings(state);
      _markStep(4);

      state = state.copyWith(setupStatus: SetupStatus.success);
    } catch (e) {
      state = state.copyWith(
        setupStatus: SetupStatus.error,
        errorMessage: 'Setup failed. Please try again.\n${e.toString()}',
      );
    }
  }
}

// ─────────────────────────────────────────────────────
//  PROVIDER
// ─────────────────────────────────────────────────────

final businessSetupProvider =
StateNotifierProvider<BusinessSetupNotifier, BusinessSetupState>(
      (ref) => BusinessSetupNotifier(),
);