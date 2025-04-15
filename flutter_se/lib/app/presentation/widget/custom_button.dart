import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: isOutlined ? Colors.white : Colors.blue,
        side: isOutlined ? const BorderSide(color: Colors.blue) : BorderSide.none,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: isOutlined ? Colors.blue : Colors.white),
      ),
    );
  }
}
