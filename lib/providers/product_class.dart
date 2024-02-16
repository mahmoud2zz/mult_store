
class Product {
  String name;
  double price;
  int qty;
  int qntty;
  List imageUrl;
  String documentId;
  String suppId;

  Product(
      {required this.name,
        required this.price,
        required this.qty,
        required this.qntty,
        required this.imageUrl,
        required this.documentId,
        required this.suppId});

  void increase() {
    qty++;
  }

  void decrease() {
    qty--;
  }
}
