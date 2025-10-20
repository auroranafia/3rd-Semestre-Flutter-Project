import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
      child: Column(
        children: [
          // Garis atas halus
          Container(height: 1, color: Colors.pink.shade100),
          const SizedBox(height: 30),

          // Baris utama isi footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🩰 Aurora Luxe Voyage
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Aurora Luxe Voyage",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb58e91),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Bringing global elegance to your doorstep. We specialize in overseas consignment of premium heels — curating timeless designs from Paris, Milan, and London for women who walk with confidence and grace.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFb58e91),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 40),

              // 📦 Customer Care
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Customer Care",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb58e91),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("FAQ",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFb58e91))),
                    Text("How to Order",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFb58e91))),
                    Text("Shipping & Tracking",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFb58e91))),
                    Text("Return & Refund Policy",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFb58e91))),
                    Text("Terms & Conditions",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFb58e91))),
                  ],
                ),
              ),

              SizedBox(width: 40),

              // ☎️ Contact Us
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb58e91),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _contactRow(
                        LucideIcons.mapPin, "Magetan, East Java, Indonesia"),
                    _contactRow(LucideIcons.mail,
                        "hello@auroraluxevoyage.com"),
                    _contactRow(LucideIcons.phone,
                        "+62 812 3456 7890 (WhatsApp)"),
                    _contactRow(LucideIcons.clock, "Mon–Sat, 9AM–8PM"),
                  ],
                ),
              ),

              SizedBox(width: 40),

              // 🌸 Follow Us
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Follow Us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb58e91),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _iconText(LucideIcons.instagram, "@auroraluxevoyage"),
                    _iconText(LucideIcons.music, "TikTok: @auroraluxevoyage"),
                    _iconText(LucideIcons.mailOpen, "Join our insider list"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          const Divider(color: Color(0xFFFFE5EC), thickness: 1),
          const SizedBox(height: 10),
          const Text(
            "© 2025 Aurora Luxe Voyage · All Rights Reserved.\nDesigned with love by Aurora Team.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Color(0xFFb58e91)),
          ),
        ],
      ),
    );
  }

  // 🔸 Komponen contact
  static Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 15, color: Color(0xFFb58e91)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFFb58e91)),
            ),
          ),
        ],
      ),
    );
  }

  // 🔸 Komponen follow us
  static Widget _iconText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 15, color: const Color(0xFFb58e91)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFFb58e91)),
            ),
          ),
        ],
      ),
    );
  }
}
