import 'package:flutter/material.dart';
import 'package:grocery_app/view_model/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<NavigationProvider>(
      builder: (context, navProvider, child) {
        return SizedBox(
          width: size.width,
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: BNBCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF34C759),
                  elevation: 8,
                  onPressed: () {
                    navProvider.setIndex(2);
                  },
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(
                      context,
                      icon: Icons.home_outlined,
                      label: 'Home',
                      index: 0,
                      currentIndex: navProvider.currentIndex,
                      onTap: () => navProvider.setIndex(0),
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.shopping_bag_outlined,
                      label: 'Order',
                      index: 1,
                      currentIndex: navProvider.currentIndex,
                      onTap: () => navProvider.setIndex(1),
                    ),
                    Container(width: size.width * 0.20),
                    _buildNavItem(
                      context,
                      icon: Icons.local_offer_outlined,
                      label: 'Offer',
                      index: 3,
                      currentIndex: navProvider.currentIndex,
                      onTap: () => navProvider.setIndex(3),
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.more_horiz,
                      label: 'More',
                      index: 4,
                      currentIndex: navProvider.currentIndex,
                      onTap: () => navProvider.setIndex(4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.green.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white30,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white30,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF34C759)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
