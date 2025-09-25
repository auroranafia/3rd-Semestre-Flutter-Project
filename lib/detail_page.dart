import 'package:flutter/material.dart';
import 'models/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSize = 38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(widget.product.image, height: 250, fit: BoxFit.contain),
              ),
              const SizedBox(height: 20),

              Text(
                widget.product.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${widget.product.priceUSD.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              Text("Heel Height: ${widget.product.heelHeight} cm",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              const Text(
                "Available Sizes:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [38, 39, 40, 41, 42].map((size) {
                  return ChoiceChip(
                    label: Text(size.toString()),
                    selected: selectedSize == size,
                    onSelected: (val) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${widget.product.name} (Size $selectedSize) added to cart!",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "ADD TO CART",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
