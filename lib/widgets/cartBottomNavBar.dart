import 'package:flutter/material.dart';

class cartBottomNavBar extends StatefulWidget {
  const cartBottomNavBar({super.key});

  @override
  State<cartBottomNavBar> createState() => _cartBottomNavBarState();
}

class _cartBottomNavBarState extends State<cartBottomNavBar> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE5E7EB),
              blurRadius: 8,
              offset: Offset(0, -1),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total:",
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$29.00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tombol Checkout dengan animasi
            GestureDetector(
              onTapDown: (_) {
                setState(() => _pressed = true);
              },
                onTapUp: (_) {
                setState(() => _pressed = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Proceed to checkout...",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.green, // hijau terang
                    behavior: SnackBarBehavior.floating, // mengambang
                    margin: EdgeInsets.all(16), // ada jarak biar lebih modern
                    duration: Duration(seconds: 1), // durasi notifikasi
                  ),
                );
              },
              onTapCancel: () {
                setState(() => _pressed = false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                height: _pressed ? 45 : 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    if (!_pressed)
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}