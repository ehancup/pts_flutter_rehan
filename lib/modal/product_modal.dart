class Cart {
  final int index;
  final String title;
  final String picture;
  final int price;
  final int quantity;


  Cart({required this.index, required this.title, required this.price, required this.picture, required this.quantity});
}

// class CartItem {
//   final Cart cart;
//   int quantity;
//
//   CartItem(this.cart, this.quantity);
// }