class CartItem {
  final String name;
  final double price;
  int quantity; // Add quantity property

  CartItem(
      {required this.name,
      required this.price,
      this.quantity = 1}); // Default quantity to 1

  // Override == operator and hashCode for proper comparison and identification of items
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          quantity == other.quantity;

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ quantity.hashCode;
}
