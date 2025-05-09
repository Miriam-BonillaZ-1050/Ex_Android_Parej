import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6A7), // Fondo amarillo claro
      body: SafeArea(
        child: Column(
          children: [
            // Parte superior con imagen y botones
            // Parte superior con imagen y botones
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.55, // << Aumenta el alto
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFC94A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/gucci_hoodie.png',
                      height: MediaQuery.of(context).size.height *
                          0.45, // << Imagen más grande
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.more_vert, color: Colors.black),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 32,
                  child: Column(
                    children: const [
                      ColorDot(color: Color(0xFFB8B8B8), selected: true),
                      SizedBox(height: 8),
                      ColorDot(color: Color(0xffffeab8)),
                      SizedBox(height: 8),
                      ColorDot(color: Color(0xFF76D7C4)),
                      SizedBox(height: 8),
                      ColorDot(color: Color(0xFFB2BFFF)),
                    ],
                  ),
                )
              ],
            ),

            // Parte inferior con detalles
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gucci Oversize Hoodie",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text("4.5 (2.7k)",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Gucci Oversize Hoodie, a hoodie with the Style of gucci made of soft silk fabric, and made with an oversized model according to today's times",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    // Selector de tallas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ["S", "M", "L", "XL", "XXL"].map((size) {
                        bool isSelected = size == "M";
                        return ChoiceChip(
                          label: Text(size),
                          selected: isSelected,
                          selectedColor: const Color(0xFFFFC94A),
                        );
                      }).toList(),
                    ),
                    const Spacer(),

                    // Precio + botón
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$79.99",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("Add to Cart"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFC94A),
                            foregroundColor: Color(0xffffffff),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget para los círculos de color
class ColorDot extends StatelessWidget {
  final Color color;
  final bool selected;

  const ColorDot({super.key, required this.color, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected ? Border.all(color: Colors.black, width: 2) : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
