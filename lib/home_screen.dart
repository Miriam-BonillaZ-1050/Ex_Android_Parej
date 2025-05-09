import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Howdy, What Are You\nLooking For ? 👀",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Aesthetic Shirt",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CategoryChip(text: "Woman"),
                  CategoryChip(text: "T-Shirt"),
                  CategoryChip(text: "Dress"),
                ],
              ),
              const SizedBox(height: 24),
              _sectionTitle("New Arrival"),
              const SizedBox(height: 12),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      image: 'assets/images/gucci_hoodie.png',
                      title: 'Gucci Oversize Hoodie',
                      price: 79.99,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProductDetailScreen())),
                    ),
                    ProductCard(
                      image: 'assets/images/jacket.png',
                      title: 'Man Premium Rain Jacket',
                      price: 39.99,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionTitle("Best Of Sell"),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/images/miniso.png',
                          width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                        child: Text("Miniso Woman Oversize T-Shirt",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    const Text("\$79.99",
                        style: TextStyle(color: Colors.orange)),
                    const SizedBox(width: 8),
                    const Icon(Icons.favorite, color: Colors.red)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("View All",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500))
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String text;
  const CategoryChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final VoidCallback? onTap;

  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Expanded(
                child: Image.asset(image, fit: BoxFit.contain, height: 120)),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text("\$$price",
                style: const TextStyle(fontSize: 14, color: Colors.deepOrange)),
          ],
        ),
      ),
    );
  }
}
