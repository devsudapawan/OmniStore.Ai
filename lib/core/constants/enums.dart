// // LIST OF Enums
// /// They cannot be created inside a class.
// enum TextSizes { small, medium, large }
// enum OrderStatus { processing, shipped, delivered }
// enum PaymentMethods { paypal, googlePay, applePay, visa, masterCard, creditCard, paystack, razorPay, paytm }



enum SyncStatus { pending, synced, failed }

enum InventoryEventType {
  initial,
  purchase,
  sale,
  returnItem,
  damage,
  adjustment,
}

enum TransactionType { sale, payment, returnItem }