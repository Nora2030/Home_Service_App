
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isBack;

  const NavigationButton({
    required this.icon,
    required this.onTap,
    this.isBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.1),
          border: Border.all(color: const Color(0xff6759FF), width: 2),
        ),
        child: Icon(
          icon,
          color: const Color(0xff6759FF),
          size: 30,
        ),
      ),
    );
  }
}
