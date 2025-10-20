class Product {
  final String name;
  final double priceUSD;
  final String image;
  final String description;
  final String brand;
  final double rating;

  Product({
    required this.name,
    required this.priceUSD,
    required this.image,
    required this.description,
    required this.brand,
    this.rating=4.5
  });
}
