import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSlider extends StatefulWidget {
  final VoidCallback onShopNow;

  const HeroSlider({super.key, required this.onShopNow});

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/hero1.png',
      'title': 'Exciting Concepts',
      'subtitle':
          'Step into a world where luxury meets artistry — each pair of heels crafted to tell a story of elegance, sophistication, and timeless beauty.',
    },
    {
      'image': 'assets/images/hero2.png',
      'title': 'Elegance in Every Step',
      'subtitle':
          'From the heart of Parisian ateliers to your wardrobe, our collection brings the finest designer craftsmanship to elevate your every stride.',
    },
    {
      'image': 'assets/images/hero3.png',
      'title': 'Luxury Meets Comfort',
      'subtitle':
          'Walk with confidence and grace in designs that blend comfort with couture — made for women who know their worth and own their style.',
    },
  ];

  @override
  void initState() {
    super.initState();
    // 🔁 Auto-slide setiap 5 detik
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _slides.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🖼️ PageView untuk slide gambar
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
          itemCount: _slides.length,
          itemBuilder: (context, index) {
            final slide = _slides[index];
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFEFF2), Color(0xFFFBE4E9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 📝 Text Section
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide['title']!,
                            style: GoogleFonts.playfairDisplay(
                              textStyle: const TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            slide['subtitle']!,
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.black54,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 👠 Gambar Heels
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        slide['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // 🔘 Indicator bulat di bawah slide
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _slides.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 14 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.pinkAccent
                      : Colors.pinkAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ),

        // 🌸 Tombol “SHOP NOW” hanya sekali
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: widget.onShopNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.pinkAccent.withOpacity(0.4),
                elevation: 5,
              ),
              child: const Text(
                "SHOP NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
