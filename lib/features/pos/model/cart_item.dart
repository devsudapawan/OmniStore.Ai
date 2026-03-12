class CartItem {
  final String productId;
  final String name;
  final double price;
  final String unit;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.unit,
    required this.quantity,
  });

  double get total => price * quantity;

  CartItem copyWith({int? quantity}) => CartItem(
    productId: productId,
    name: name,
    price: price,
    unit: unit,
    quantity: quantity ?? this.quantity,
  );
}