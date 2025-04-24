import 'package:flutter/material.dart';
import '../widget/custom_button.dart'; // Pastikan path sesuai
import '../widget/custom_card.dart';  // Pastikan path sesuai

class CustomPopup extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String buttonText;

  const CustomPopup({
    super.key,
    required this.message,
    required this.onPressed,
    required this.backgroundColor,
    this.buttonText = "Oke",
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: buttonText,
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
