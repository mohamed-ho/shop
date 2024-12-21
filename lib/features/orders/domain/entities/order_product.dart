class OrderProduct {
  int id;
  String title;
  double price;
  String description;
  String image;
  int quantity;
  double totalPrice;
  OrderProduct(
      {required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.quantity,
      required this.title,
      required this.totalPrice});
}
