import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/manager.dart';
import '../detail_page.dart';
import '../cart_page.dart';
import '../wishlist_page.dart';
import '../account_page.dart';
import '../message_page.dart';
import 'hero_slider.dart';
import 'footer_section.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductManager manager = ProductManager();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _recommendedKey = GlobalKey(); // 🌸 Tambahkan key

  String? selectedBrand;
  String searchQuery = '';

  // ✅ Fungsi scroll diperbaiki supaya tidak sampai bawah
  void _scrollToRecommended() {
    Future.delayed(const Duration(milliseconds: 300), () {
      final context = _recommendedKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  List get filteredProducts {
    final query = searchQuery.toLowerCase().trim();
    final brandFilter = selectedBrand?.toLowerCase().trim();

    return manager.products.where((p) {
      final matchBrand =
          brandFilter == null || p.brand.toLowerCase() == brandFilter;
      final matchSearch = p.name.toLowerCase().contains(query);
      return matchBrand && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;
    final random = Random();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD6DE),
        elevation: 0,
        title: Text(
          'Aurora Luxe Voyage',
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          _navButton(context, "Cart", Icons.shopping_cart_outlined,
              CartPage(manager: manager)),
          _navButton(context, "Wishlist", Icons.favorite_border,
              WishlistPage(manager: manager)),
          _navButton(context, "Message", Icons.chat_bubble_outline,
              const MessagePage()),
          _navButton(context, "Account", Icons.person_outline,
              const AccountPage()),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔍 SEARCH BAR
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),

              // 🌸 HERO SECTION
              SizedBox(
                width: double.infinity,
                height: 400,
                child: HeroSlider(onShopNow: _scrollToRecommended),
              ),

              const SizedBox(height: 40),

              // 👠 SHOP BY BRAND (centered)
              Text(
                "Shop by Brand",
                style: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _brandCircle("Jimmy Choo", "assets/images/logo/jimmy_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("Christian Louboutin", "assets/images/logo/louboutin_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("YSL", "assets/images/logo/ysl_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("Gucci", "assets/images/logo/gucci_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("Prada", "assets/images/logo/prada_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("Manolo Blahnik", "assets/images/logo/manolo_logo.png"),
                    const SizedBox(width: 18),
                    _brandCircle("Valentino", "assets/images/logo/valentino_logo.png"),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              // 👜 RECOMMENDED PRODUCTS
              Padding(
                key: _recommendedKey, // ✅ Tambahkan key di sini
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedBrand == null
                          ? "Recommended Products"
                          : "$selectedBrand Collection",
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (selectedBrand != null)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedBrand = null;
                          });
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 🛍️ Product Grid (3 kolom)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final p = products[index];
                    final rating = (random.nextDouble() * 2 + 3).clamp(1.0, 5.0);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              product: p,
                              onAddToCart: (prod) {
                                setState(() {
                                  manager.addToCart(prod);
                                });
                              },
                              onAddToWishlist: (prod) {
                                setState(() {
                                  manager.addToWishlist(prod);
                                });
                              },
                            ),
                          ),
                        ).then((_) => setState(() {}));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 3,
                        color: const Color(0xFFFCF7FA),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  p.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      p.name,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      "\$${p.priceUSD.toStringAsFixed(2)}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    RatingBarIndicator(
                                      rating: rating,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 14,
                                      direction: Axis.horizontal,
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

              const SizedBox(height: 60),
              const FooterSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 🩰 BRAND CIRCLE
  Widget _brandCircle(String name, String imagePath) {
    final bool isActive = selectedBrand == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBrand = name;
          _scrollToRecommended();
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? Colors.pinkAccent.withOpacity(0.25)
                  : const Color(0xFFFFE5EC),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.pinkAccent : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // 🛍️ NAV BUTTON
  Widget _navButton(
      BuildContext context, String label, IconData icon, Widget? page) {
    int count = 0;
    if (label == "Cart") {
      count = manager.cart.length;
    } else if (label == "Wishlist") {
      count = manager.wishlist.length;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        TextButton.icon(
          onPressed: page == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => page),
                  ).then((_) => setState(() {}));
                },
          icon: Icon(icon, color: Colors.black87, size: 18),
          label: Text(label,
              style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13)),
        ),
        if (count > 0)
          Positioned(
            right: 6,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
