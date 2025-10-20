import 'product.dart';

class ProductManager {
  final List<Product> products = [
    // Jimmy Choo
    Product(
      name: "Jimmy Choo Heels",
      priceUSD: 1000.0,
      image: "assets/images/Jimmy_choo/jimmy_choo.png",
      description: "Elegant black velvet heels with refined straps.",
      brand: "Jimmy Choo",
    ),

    Product(
      name: "Jimmy choo Love Pumps",
      priceUSD: 825,
      image: "assets/images/Jimmy_choo/love_pumps.png",
      description: "The “Love” pump features a sleek pointed-toe silhouette with a high vamp and a signature JC emblem at the heel. Crafted in premium patent or suede leather, it delivers polished elegance ideal for evening wear or upscale dinner events. Heel height typically 85 mm for the “Love 85” version.",
      brand: "Jimmy Choo",
    ),

    Product(
      name: "Jimmy Choo Minny",
      priceUSD: 895,
      image: "assets/images/Jimmy_choo/minny.png",
      description: "The “Minny” pump is a sophisticated stiletto featuring a pointed toe and a slim ankle strap with a delicate buckle closure. Made from luxurious satin or leather, it exudes timeless glamour perfect for cocktail parties or formal occasions. Heel height usually around 100 mm.",
      brand: "Jimmy Choo",
    ),

    Product(
      name: "Jimmy Choo Romy",
      priceUSD: 795,
      image: "assets/images/Jimmy_choo/romy.png",
      description: "The “Romy” pump is a classic pointed-toe stiletto known for its sleek and elegant design. Crafted from premium leather or suede, it features a high heel that elongates the leg, making it a versatile choice for both professional settings and evening events. Heel height typically ranges from 85 mm to 100 mm.",
      brand: "Jimmy Choo",
    ),
    Product(
      name: "Jimmy Choo Sacora Sandals",
      priceUSD: 1100,
      image: "assets/images/Jimmy_choo/sacora_sandals.png",
      description: "The “Sacora” sandal is a glamorous high-heeled sandal featuring a strappy design with sparkling embellishments. Made from luxurious materials like satin or leather, it boasts a stiletto heel and an open toe, perfect for red carpet events or upscale parties. Heel height is typically around 100 mm.",
      brand: "Jimmy Choo",
    ),

    //Louboutin - So Kate
    Product(
      name: "Louboutin So Kate",
      priceUSD: 1200.0,
      image: "assets/images/christian_louboutin/louboutin.png",
      description: "Classic glossy pumps with red sole.",
      brand: "Christian Louboutin",
    ),

    Product(
      name: "Christian Louboutin Follies Strass",
      priceUSD: 1095.0, 
      image: "assets/images/christian_louboutin/follies_strash.png",
      description:
          "The Follies Strass pumps are a dazzling statement piece crafted from fine mesh embellished with shimmering crystal strass. Featuring a 100 mm stiletto heel wrapped in suede, they offer a glass-like transparency that elongates the leg and exudes sophistication. Perfect for evening galas, luxury events, or red-carpet moments.",
      brand: "Christian Louboutin",
    ),

    Product(
      name: "Christian Louboutin Hot Chick",
      priceUSD: 945.0,
      image: "assets/images/christian_louboutin/hot_chick.png",
      description:
          "A true icon of feminine allure, the Hot Chick features scalloped edges and a deep décolleté cut that highlights the natural arch of the foot. Made from glossy patent calf leather with a 100 mm stiletto heel, it combines boldness and elegance — ideal for glamorous parties and high-fashion soirées.",
      brand: "Christian Louboutin",
    ),

    Product(
      name: "Christian Louboutin Pigalle Follies",
      priceUSD: 1000.0,
      image: "assets/images/christian_louboutin/pigalle_folies.png",
      description:
          "The Pigalle Follies is a modern reinterpretation of the brand’s classic Pigalle pumps. Featuring a pointed toe, slender stiletto heel, and optional mesh or glitter finish, this pair blends sensuality with grace. Suitable for cocktail events, weddings, or luxury evening occasions.",
      brand: "Christian Louboutin",
    ),

    // 💛 YSL - Blade Heels
    Product(
      name: "Yves Saint Laurent (YSL) Blade Heels",
      priceUSD: 1300.0,
      image: "assets/images/YSL/blade_heels.png",
      description:
          "The YSL Blade Heels redefine modern edge and luxury. Characterized by an ultra-thin 'blade-like' heel and sleek pointed toe, these shoes are crafted from premium leather with a mirror-finish effect. Designed for daring, fashion-forward women who command attention at any exclusive night event.",
      brand: "YSL",
    ),

    Product(
      name: "Yves Saint Laurent (YSL) Tribute Sandals",
      priceUSD: 1150.0,
      image: "assets/images/YSL/tribute_sandals.png",
      description:
          "The YSL Tribute Sandals are a symbol of bold femininity and glamour. Featuring a high platform sole and a slender stiletto heel, these sandals are crafted from luxurious leather with signature YSL branding. Perfect for upscale parties, red-carpet events, or any occasion where you want to make a statement.",
      brand: "YSL",
    ),

    Product(
      name: "YSL Opyum Heels",
      priceUSD: 1666.67,
      image: "assets/images/YSL/ysl.png",
      description: "Iconic heels with golden YSL logo heel design.",
      brand: "YSL",
    ),

    // gucci
    Product(
      name: "Gucci Horsebit Pumps",
      priceUSD: 950.0,
      image: "assets/images/gucci/horsebit_pumps.png",
      description:
          "The Gucci Horsebit Pumps are a sophisticated blend of classic design and modern luxury. Featuring the iconic horsebit detail on the vamp, these pumps are crafted from premium leather with a sleek pointed toe and a comfortable mid-height heel. Perfect for elevating both professional and casual outfits with a touch of Gucci elegance.",
      brand: "Gucci",
    ),
    Product(
      name: "Gucci Marmont Sandals",
      priceUSD: 1200.0,
      image: "assets/images/gucci/marmont_sandals.png",
      description:
          "The Gucci Marmont Sandals are a chic and versatile addition to any wardrobe. Featuring the signature GG logo on the straps, these sandals are crafted from high-quality leather with a comfortable block heel and an open toe design. Ideal for both daytime outings and evening events, they effortlessly combine style and comfort.",
      brand: "Gucci",
    ),
    Product(
      name: "Gucci Sylvie",
      priceUSD: 1300.0,
      image: "assets/images/gucci/sylvie.png",
      description:
          "The Gucci Sylvie pumps are a statement of bold elegance and contemporary style. Featuring the iconic Sylvie web stripe and gold-tone chain detail, these pumps are crafted from luxurious leather with a pointed toe and a high stiletto heel. Perfect for making a fashionable impression at any upscale event.",
      brand: "Gucci",
    ),
    Product(
      name: "Gucci Marmont Sandals",
      priceUSD: 850.0,
      image: "assets/images/gucci/marmont_sandals.png",
      description:
          "The Gucci Princetown Leather Slippers are a blend of casual sophistication and timeless design. Crafted from premium leather, these backless loafers feature the iconic horsebit detail on the vamp and a comfortable flat sole. Ideal for both relaxed weekends and stylish outings, they offer effortless elegance with every step.",
      brand: "Gucci",
    ),

    // Manolo Blanhik
    Product(
      name: "Manolo Blahnik Chaos Sandals",
      priceUSD: 1500.0,
      image: "assets/images/manolo_blahnik/chaos_sandals.png",
      description:
          "The Manolo Blahnik Chaos Sandals are a stunning embodiment of avant-garde elegance. Featuring an intricate strappy design that wraps around the foot and ankle, these sandals are crafted from luxurious materials with a high stiletto heel. Perfect for making a bold statement at upscale events and glamorous soirées.",
      brand: "Manolo Blahnik",
    ),
    Product(
      name: "Manolo Blahnik Hangisi",
      priceUSD: 995.0,
      image: "assets/images/manolo_blahnik/hangisi.png",
      description:
          "The Manolo Blahnik Hangisi pumps are a timeless symbol of refined elegance and sophistication. Featuring a pointed toe and a signature crystal-embellished buckle on the vamp, these pumps are crafted from premium satin or leather with a comfortable mid-height heel. Ideal for weddings, formal events, and special occasions where classic style is paramount.",
      brand: "Manolo Blahnik",
    ),
    Product(
      name: "Manolo Blahnik Maysale",
      priceUSD: 1100.0,
      image: "assets/images/manolo_blahnik/maysale.png",    
      description:
          "The Manolo Blahnik Maysale pumps are a chic and contemporary take on classic elegance. Featuring a sleek pointed toe and a slender stiletto heel, these pumps are crafted from luxurious leather or suede with a minimalist design. Perfect for both professional settings and stylish evening outings, they offer versatile sophistication with every step.",
      brand: "Manolo Blahnik",
    ),

    //prada
    Product(
      name: "Prada Cleo Sandals",
      priceUSD: 1250.0,
      image: "assets/images/prada/cleo_sandals.png",
      description:
          "The Prada Cleo Sandals are a modern expression of luxury and style. Featuring a sleek strappy design with a high stiletto heel, these sandals are crafted from premium leather with Prada's signature attention to detail. Ideal for upscale events and fashionable gatherings, they exude sophistication and elegance.",
      brand: "Prada",
    ),
    Product(
      name: "Prada Slingback Pumps",
      priceUSD: 1150.0,
      image: "assets/images/prada/slingback_pumps.png",
      description:
          "The Prada Slingback Pumps are a timeless blend of classic design and contemporary flair. Featuring a pointed toe and an adjustable slingback strap, these pumps are crafted from luxurious leather with a comfortable mid-height heel. Perfect for both professional settings and elegant evening occasions, they offer versatile sophistication with every step.",
      brand: "Prada",
    ),    

    //valentino
    Product(
      name: "Valentino Rockstud Pumps", 
      priceUSD: 1250.0,
      image: "assets/images/valentino/rockstud_pumps.png",
      description:
          "The Valentino Rockstud Pumps are a bold fusion of edgy design and high fashion. Featuring Valentino's signature pyramid studs adorning the straps and edges, these pumps are crafted from premium leather with a pointed toe and a high stiletto heel. Perfect for making a statement at upscale events and  glamorous soirées.",
      brand: "Valentino",
    ),
    Product(
      name: "Valentino Rockstud Sandals",
      priceUSD: 1300.0,
      image: "assets/images/valentino/rockstud_sandals.png",
      description:
          "The Valentino Rockstud Sandals are a striking embodiment of contemporary elegance and bold style. Featuring the iconic pyramid studs along the straps, these sandals are crafted from luxurious leather with an open toe and a high stiletto heel. Ideal for upscale events and fashionable gatherings, they exude sophistication with an edgy twist.",
      brand: "Valentino",
    ),
    Product(
      name: "Valentino VLogo Slingbacks",
      priceUSD: 1200.0,
      image: "assets/images/valentino/vlogo_slingbacks.png",
      description:
          "The Valentino VLogo Slingbacks are a chic and modern take on classic elegance. Featuring the signature VLogo plaque on the vamp, these slingback pumps are crafted from premium leather with a pointed toe and a comfortable mid-height heel. Perfect for both professional settings and stylish evening outings, they offer versatile sophistication with every step.",
      brand: "Valentino",
    ), 
  ];

  final List<Product> cart = [];
  final List<Product> wishlist = [];

  double get cartTotal {
    return cart.fold(0, (sum, item) => sum + (item.priceUSD ?? 0));
  }

  void addToCart(Product product) {
    cart.add(product);
  }

  void removeFromCart(Product product) {
    cart.remove(product);
  }

  void addToWishlist(Product product) {
    wishlist.add(product);
  }

  void removeFromWishlist(Product product) {
    wishlist.remove(product);
  }
}
