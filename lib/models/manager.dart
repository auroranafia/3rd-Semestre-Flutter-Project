import 'product.dart';

class ProductManager {
  static const double exchangeRate = 15000; // Rp to USD

  List<Product> products = [
    Product(
      "Jimmy Choo Heels",
      15000000 / exchangeRate, // Rp 15,000,000 → $1000
      12,
      "Elegant high heels with premium suede material and ankle strap. Perfect for evening events.",
      "assets/images/jimmy_choo.png",
    ),
    Product(
      "YSL Opyum Heels",
      25000000 / exchangeRate, // Rp 25,000,000 → $1666.67
      11,
      "Iconic YSL Opyum heels with a glossy finish and YSL monogram heel design. Bold and luxurious.",
      "assets/images/ysl.png",
    ),
    Product(
      "Louboutin So Kate",
      18000000 / exchangeRate, // Rp 18,000,000 → $1200
      12,
      "Classic Christian Louboutin heels with signature red sole and sleek pointed toe design.",
      "assets/images/louboutin.png",
    ),
  ];
}
