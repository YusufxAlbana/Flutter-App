import 'package:flutter/material.dart';
import 'cart_page.dart'; // pastikan path sesuai project kamu

class detailProductPage extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const detailProductPage({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Gambar Produk 1:1 + tombol back di atasnya
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1, // foto jadi kotak 1:1
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Nama Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF42B549),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Harga Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Rp ${price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi Produk
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Deskripsi Produk:\n"
                "Ini adalah deskripsi singkat produk dummy. Cocok digunakan untuk testing tampilan detail produk di aplikasi e-commerce Anda.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Tombol Aksi (ke CartPage)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text("Tambah ke Keranjang", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF42B549),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.payment),
                      label: const Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
