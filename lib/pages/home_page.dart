import 'package:e_commerse_flutter_app/pages/account_page.dart';
import 'package:e_commerse_flutter_app/pages/cart_page.dart';
import 'package:e_commerse_flutter_app/widgets/categoriesWidget.dart';
import 'package:e_commerse_flutter_app/widgets/homeAppBar.dart';
import 'package:e_commerse_flutter_app/widgets/itemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          homePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 70,
        color: const Color(0xFF42B549),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: _currentIndex == 0 ? Colors.yellow : Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: _currentIndex == 1 ? Colors.yellow : Colors.white,
          ),
          Icon(
            Icons.account_circle_sharp,
            size: 30,
            color: _currentIndex == 2 ? Colors.yellow : Colors.white,
          ),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}

class homePageContent extends StatefulWidget {
  const homePageContent({super.key});

  @override
  State<homePageContent> createState() => _homePageContentState();
}

class _homePageContentState extends State<homePageContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeAppBar(),
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color(0xFFFEDFCF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Cari produk di sini...",
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Color(0xFF42B549),
                    ),
                  ],
                ),
              ),

              // Bagian Kategori
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: const Text(
                  'Kategori Populer',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF42B549),
                  ),
                ),
              ),
              const CategoriesWidget(),

              // Bagian Produk Terlaris
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Produk Terlaris',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42B549),
                      ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Color(0xFF42B549),
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              
              // Widget untuk menampilkan produk
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ItemsWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}