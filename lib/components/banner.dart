import 'package:flutter/material.dart';

class BannerYoutube extends StatelessWidget {
  const BannerYoutube({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      width: double.infinity,
      child: Image.asset(
        'images/banner.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}
