import 'package:e_commerse_flutter_app/pages/detail_product.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data produk, ganti dengan data produk asli dari backend
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/images/carts/1.jpeg',
        'title': 'Baju Outdoor Set',
        'description': 'Setelan baju dan celana outdoor dengan bahan berkualitas, nyaman dan anti-air.',
        'price': 250000.0,
        'discount': 58,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/carts/2.jpeg',
        'title': 'Selai Coklat Lezat',
        'description': 'Selai coklat dengan rasa otentik, cocok untuk roti, kue, atau camilan lainnya.',
        'price': 55000.0,
        'discount': 58,
        'rating': 4.8,
      },
      {
        'image': 'assets/images/carts/3.jpeg',
        'title': 'Skincare Mahal',
        'description': 'skincare mahal punya ripai kamar 3.A.',
        'price': 250000.0,
        'discount': 58,
        'rating': 4.5,
      },
      {
        'image': 'assets/images/carts/4.jpeg',
        'title': 'TWS Bekas Maman',
        'description': 'TWS bekas Maman yang ada Emas2 nya.',
        'price': 55000.0,
        'discount': 58,
        'rating': 4.8,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;
        double childAspectRatio = 0.65;
        double mainAxisSpacing = 10;
        double crossAxisSpacing = 10;
        
        final double screenWidth = constraints.maxWidth;

        if (screenWidth > 1200) {
          crossAxisCount = 4;
          childAspectRatio = 0.8;
          mainAxisSpacing = 20;
          crossAxisSpacing = 20;
        } else if (screenWidth > 800) {
          crossAxisCount = 3;
          childAspectRatio = 0.9; // Nilai ini disesuaikan agar tidak nabrak di layar web
          mainAxisSpacing = 15;
          crossAxisSpacing = 15;
        } else if (screenWidth > 600) {
          crossAxisCount = 2;
          childAspectRatio = 0.75;
        } else {
          crossAxisCount = 2;
          childAspectRatio = 0.65;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final discountedPrice = product['price'] * (1 - product['discount'] / 100);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailProductPage(
                        name: product['title'],
                        image: product['image'],
                        price: discountedPrice,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar produk
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(product['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '-${product['discount']}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Nama produk
                        Text(
                          product['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        // Deskripsi singkat
                        Text(
                          product['description'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        // Rating
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${product['rating']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Harga dan tombol keranjang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rp ${product['price']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  'Rp ${discountedPrice.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF42B549),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFF42B549),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}