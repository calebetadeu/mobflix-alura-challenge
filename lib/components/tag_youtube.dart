import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class TagYoutube extends StatelessWidget {
  const TagYoutube(
      {Key? key,
      required this.name,
      required this.color,
      this.changeColor,
      this.isSelected = false,
      this.type // Tornando changeColor opcional
      })
      : super(key: key);

  final String? name;
  final Color? color;
  final TypeCategory? type;
  final bool isSelected;
  final Future<void> Function()? changeColor; // Usando uma função opcional

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          if (changeColor != null) {
            await changeColor!();
          }
          if (isSelected) {
            textColor = Colors.white;
          } else {
            textColor = Colors.lime;
          }
        },
        child: name != null
            ? Text(
                name!,
                style: TextStyle(fontSize: 18, color: textColor),
              )
            : const SizedBox());
  }
}
