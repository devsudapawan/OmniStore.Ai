import 'cart_item.dart';

enum PaymentMethod { cash, upi, card, credit }

extension PaymentMethodExt on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.cash:   return 'Cash';
      case PaymentMethod.upi:    return 'UPI';
      case PaymentMethod.card:   return 'Card';
      case PaymentMethod.credit: return 'Credit';
    }
  }

  String get emoji {
    switch (this) {
      case PaymentMethod.cash:   return '💵';
      case PaymentMethod.upi:    return '📲';
      case PaymentMethod.card:   return '💳';
      case PaymentMethod.credit: return '📒';
    }
  }
}

enum PosStatus { idle, processing, success, error }

class PosSession {
  final String? customerId;
  final String customerName;
  final List<CartItem> cart;
  final PaymentMethod? paymentMethod;
  final PosStatus status;
  final String? errorMessage;

  const PosSession({
    this.customerId,
    this.customerName = 'Walk-in Customer',
    this.cart = const [],
    this.paymentMethod,
    this.status = PosStatus.idle,
    this.errorMessage,
  });

  double get total => cart.fold(0, (s, i) => s + i.total);
  int get totalItems => cart.fold(0, (s, i) => s + i.quantity);
  bool get isCredit => paymentMethod == PaymentMethod.credit;
  bool get canCompleteSale =>
      cart.isNotEmpty &&
          paymentMethod != null &&
          status != PosStatus.processing;

  PosSession copyWith({
    String? customerId,
    String? customerName,
    List<CartItem>? cart,
    PaymentMethod? paymentMethod,
    bool clearCustomer = false,
    bool clearPayment = false,
    PosStatus? status,
    String? errorMessage,
  }) {
    return PosSession(
      customerId: clearCustomer ? null : customerId ?? this.customerId,
      customerName:
      clearCustomer ? 'Walk-in Customer' : customerName ?? this.customerName,
      cart: cart ?? this.cart,
      paymentMethod:
      clearPayment ? null : paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}