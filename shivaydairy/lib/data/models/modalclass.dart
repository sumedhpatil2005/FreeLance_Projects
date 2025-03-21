class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String weight;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.weight,
  });
}

List<CartItem> Products = [
  CartItem(
    name: 'milk',
    id: '1',
    price: 37,
    quantity: 1,
    imageUrl: "assets/allassets/product_images/amulmilk.jpg",
    weight: '500ml',
  ),
  CartItem(
    name: 'Ghee',
    id: '2',
    price: 600,
    quantity: 1,
    weight: '500ml',
    imageUrl: "assets/allassets/product_images/amulghee.jpg",
  ),
  CartItem(
    name: 'Panner',
    id: '1',
    price: 120,
    quantity: 1,
    imageUrl: "assets/allassets/product_images/amulpaneer.jpg",
    weight: '100grams',
  ),
  CartItem(
    name: 'chocolate',
    id: '1',
    price: 100,
    quantity: 1,
    weight: '500g',
    imageUrl: "assets/allassets/product_images/chocolate.jpg",
  ),
];
int index = 1;
