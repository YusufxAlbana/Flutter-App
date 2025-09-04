import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // 🔹 Menu kiri
          const Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF42B549),
          ),

          // 🔹 Judul aplikasi
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'TOKOESIAN',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF42B549),
              ),
            ),
          ),

          const Spacer(),

          // 🔹 Ikon pesan + badge notifikasi
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -8, end: -8),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(7),
            ),
            badgeContent: const Text(
              '9',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "listPage"); // Route ke ListChat
              },
              child: const Icon(
                Icons.message_sharp,
                size: 32,
                color: Color(0xFF42B549),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
