import 'product.dart';

class Order {
  String customer;
  Product product;
  int quantity;

  Order(this.customer, this.product, this.quantity);

  double get total {
    if (quantity > 1) {
      return (product.priceUSD * quantity) * 0.95; // 5% discount
    }
    return product.priceUSD * quantity;
  }

  String getReceipt() {
    return """
Customer: $customer
Product: ${product.name}
Quantity: $quantity
Total Payment: \$${total.toStringAsFixed(2)}
""";
  }
}
