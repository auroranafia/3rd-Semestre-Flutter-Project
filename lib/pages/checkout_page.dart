import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/manager.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckoutPage extends StatelessWidget {
  final Product? product;
  final ProductManager? manager;

  const CheckoutPage({super.key, this.product, this.manager});

  @override
  Widget build(BuildContext context) {
    // 🛍️ Ambil produk dari keranjang atau 1 produk langsung
    final List<Product> items =
        product != null ? [product!] : (manager?.cart ?? []);
    final double total = items.fold(0, (sum, item) => sum + item.priceUSD);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD6DE),
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // 🧾 Order Summary
                  const Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...items.map(
                    (item) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(item.image, width: 60),
                      title: Text(item.name),
                      trailing: Text(
                        "\$${item.priceUSD.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),

                  // 🏠 Shipping Information
                  const Text(
                    "Shipping Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(labelText: "Full Name"),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(labelText: "Address"),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(labelText: "Phone Number"),
                  ),
                  const SizedBox(height: 24),

                  // 💳 QR Code Payment
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Scan this QR Code to Pay",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: QrImageView(
                            data:
                                "https://auroraluxevoyage.com/pay?amount=${total.toStringAsFixed(2)}",
                            version: QrVersions.auto,
                            size: 180.0,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Total: \$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Pay Button
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Purchase successful! 🎉"),
                      backgroundColor: Colors.pinkAccent,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Confirm Payment (\$${total.toStringAsFixed(2)})",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
