import 'package:e_commerse_flutter_app/pages/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerse_flutter_app/pages/detail_product.dart'; // pastikan path benar

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  final List<String> myProductName = [
    'Baju Outdoor 1 set',
    'Selai coklat',
    'Skintific Lotion',
    'TWS Bluetooth',
  ];

  final List<String> myProductImages = [
    'images/items/1.jpeg',
    'images/items/2.jpeg',
    'images/items/3.jpeg',
    'images/items/4.jpeg',
  ];

  final List<double> myProductPrice = [
    250000, // contoh harga produk 1
    55000,  // contoh harga produk 2
    120000, // contoh harga produk 3
    180000, // contoh harga produk 4
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < myProductName.length; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Bagian atas: diskon + icon favorite
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF42B549),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '-58%',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.red),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔹 Gambar produk (klikable)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detailProductPage(
                          name: myProductName[i],
                          image: myProductImages[i],
                          price: myProductPrice[i],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: -2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        myProductImages[i],
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 🔹 Nama produk
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    myProductName[i],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF42B549),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // 🔹 Deskripsi produk
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Write description Product',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),

                // 🔹 Harga + icon cart
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp ${myProductPrice[i].toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF42B549),
                        ),
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Color(0xFF42B549),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
