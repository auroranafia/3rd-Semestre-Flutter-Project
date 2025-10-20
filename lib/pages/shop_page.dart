import 'package:flutter/material.dart';
import '../models/manager.dart';
import '../models/product.dart';
import 'detail_page.dart';

class ShopPage extends StatelessWidget {
  final String? category;
  final ProductManager manager = ProductManager();

  ShopPage({super.key, this.category});

  // 🔍 Filter produk sesuai kategori yang dipilih
  List<Product> _filterProducts(String? category) {
    if (category == null || category.isEmpty) {
      return manager.products;
    }

    final lower = category.toLowerCase();

    return manager.products.where((p) {
      final name = p.name.toLowerCase();
      return name.contains(lower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _filterProducts(category);

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD6DE),
        elevation: 1,
        title: Text(
          category ?? "Shop",
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: filteredProducts.isEmpty
          ? const Center(
              child: Text(
                "No products found in this category.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 230,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            product: p,
                            onAddToCart: (prod) {
                              manager.addToCart(prod);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${prod.name} added to cart")),
                              );
                            },
                            onAddToWishlist: (prod) {
                              manager.addToWishlist(prod);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${prod.name} added to wishlist")),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 7,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                p.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "\$${p.priceUSD.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
