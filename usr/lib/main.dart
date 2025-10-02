import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FurnitureCatalog(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class FurnitureCatalog extends StatelessWidget {
  const FurnitureCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {
        "title": "Cover Page",
        "isCover": true,
      },
      {
        "title": "Chairs",
        "products": [
          Product(
            name: "Ergonomic Office Chair",
            description: "Stay comfortable and productive with our state-of-the-art ergonomic office chair, designed to support your back and promote healthy posture throughout the day.",
            price: "\$299.99",
            imageUrl: "https://picsum.photos/seed/chair1/400/300",
          ),
          Product(
            name: "Velvet Accent Chair",
            description: "Add a touch of elegance to any room with this plush velvet accent chair. Its rich color and comfortable design make it a perfect statement piece.",
            price: "\$199.99",
            imageUrl: "https://picsum.photos/seed/chair2/400/300",
          ),
        ],
      },
      {
        "title": "Tables",
        "products": [
          Product(
            name: "Rustic Farmhouse Dining Table",
            description: "Gather your family around this beautiful rustic dining table. Made from solid reclaimed wood, it brings warmth and character to your dining space.",
            price: "\$799.99",
            imageUrl: "https://picsum.photos/seed/table1/400/300",
          ),
          Product(
            name: "Modern Glass Coffee Table",
            description: "A sleek and minimalist addition to your living room. This coffee table features a tempered glass top and a sturdy chrome frame for a contemporary look.",
            price: "\$249.99",
            imageUrl: "https://picsum.photos/seed/table2/400/300",
          ),
        ],
      },
      {
        "title": "Sofas",
        "products": [
          Product(
            name: "Modular Sectional Sofa",
            description: "Create the perfect seating arrangement for your space with our versatile modular sectional sofa. Upholstered in a durable, family-friendly fabric.",
            price: "\$1499.99",
            imageUrl: "https://picsum.photos/seed/sofa1/400/300",
          ),
          Product(
            name: "Mid-Century Modern Loveseat",
            description: "A classic design with a modern twist. This loveseat features clean lines, tapered wooden legs, and comfortable cushioning, ideal for smaller spaces.",
            price: "\$699.99",
            imageUrl: "https://picsum.photos/seed/sofa2/400/300",
          ),
        ],
      },
      {
        "title": "Beds",
        "products": [
          Product(
            name: "Upholstered Platform Bed",
            description: "Sleep in style with this elegant upholstered platform bed. The tufted headboard adds a touch of luxury, and the sturdy frame provides excellent support.",
            price: "\$599.99",
            imageUrl: "https://picsum.photos/seed/bed1/400/300",
          ),
          Product(
            name: "Solid Wood Bunk Bed",
            description: "Perfect for kids' rooms or guest spaces, this solid wood bunk bed is a space-saving solution that's both durable and stylish.",
            price: "\$499.99",
            imageUrl: "https://picsum.photos/seed/bed2/400/300",
          ),
        ],
      },
      {
        "title": "Storage",
        "products": [
          Product(
            name: "Industrial Style Bookshelf",
            description: "Showcase your books and decor on this chic industrial bookshelf, featuring a metal frame and rustic wood shelves.",
            price: "\$229.99",
            imageUrl: "https://picsum.photos/seed/storage1/400/300",
          ),
          Product(
            name: "Scandinavian Sideboard",
            description: "Organize your dining or living area with this minimalist sideboard. It offers ample storage with its clean lines and natural wood finish.",
            price: "\$459.99",
            imageUrl: "https://picsum.photos/seed/storage2/400/300",
          ),
        ],
      },
      {
        "title": "Lighting",
        "products": [
           Product(
            name: "Arc Floor Lamp",
            description: "Illuminate your living space with this modern arc floor lamp. Its oversized design makes a dramatic statement while providing ample light.",
            price: "\$179.99",
            imageUrl: "https://picsum.photos/seed/light1/400/300",
          ),
          Product(
            name: "Crystal Chandelier",
            description: "Add a touch of glamour to any room with this stunning crystal chandelier. It's the perfect centerpiece for a dining room or entryway.",
            price: "\$399.99",
            imageUrl: "https://picsum.photos/seed/light2/400/300",
          ),
        ],
      },
      {
        "title": "Back Cover",
        "isCover": true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Furniture Catalog"),
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final pageData = pages[index];
          if (pageData["isCover"] == true) {
            return CoverPage(title: pageData["title"], pageNumber: index + 1);
          }
          return ProductPage(
            title: pageData["title"],
            products: pageData["products"],
            pageNumber: index + 1,
          );
        },
      ),
    );
  }
}

class CoverPage extends StatelessWidget {
  final String title;
  final int pageNumber;

  const CoverPage({super.key, required this.title, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title == "Cover Page" ? "Modern Furniture Collection" : "Find Us",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if(title != "Cover Page")
            const Text(
              "Visit our showroom or contact us online.",
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Text("Page $pageNumber"),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


class ProductPage extends StatelessWidget {
  final String title;
  final List<Product> products;
  final int pageNumber;

  const ProductPage({
    super.key,
    required this.title,
    required this.products,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
          Center(child: Text("Page $pageNumber")),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                product.price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
