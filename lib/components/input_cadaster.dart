import 'package:flutter/material.dart';

class InputCadaster extends StatelessWidget {
  const InputCadaster({
    super.key,
    required this.label,
    required this.hint,
    required this.controller, // Add this controller
  });

  final String label;
  final String hint;
  final TextEditingController controller; // Declare the controller

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label :",
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: controller,
            // Assign the controller
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 125, 120, 120),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
