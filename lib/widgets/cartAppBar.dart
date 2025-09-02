import 'package:flutter/material.dart';

class cartAppBar extends StatelessWidget {
  const cartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow( // 👉 shadow untuk AppBar
            color: const Color(0xFFE5E7EB).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // Tombol Back
          InkWell(
            onTap: () {
              Navigator.pop(context); // ✅ ganti dari pushNamed ke pop
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF42B549), // ✅ ganti warna
            ),
          ),

          // Teks Cart + Ikon
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.shopping_cart, color: Color(0xFF42B549)), // 🛒 ikon ✅ ganti warna
                SizedBox(width: 8),
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Popup Menu di titik tiga
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 30,
              color: Color(0xFF42B549), // ✅ ganti warna
            ),
            onSelected: (value) {
              if (value == 'refresh') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Refresh clicked")),
                );
              } else if (value == 'help') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Help clicked")),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'refresh',
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                value: 'help',
                child: Text("Help"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
