import 'package:flutter/material.dart';

class TagYoutube extends StatelessWidget {
  const TagYoutube({super.key, required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20), // Altere esse valor para ajustar o ângulo das bordas
        ),
      ),
      onPressed: () {},
      child: Text(
        name,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
