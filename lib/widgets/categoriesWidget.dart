import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List kategori yang ingin ditampilkan
    final List<String> categories = [
      'Outfit',
      'Makanan',
      'Skincare',
      'Elektronik',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'images/categories/${i + 1}.jpeg', 
                      width: 50,   // 👉 atur lebih besar kalau mau
                      height: 50,  // 👉 supaya skalanya pas
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    categories[i], // Nama kategori sesuai list
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF42B549),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
