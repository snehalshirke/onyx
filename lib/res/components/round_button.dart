import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final Color color; // Add this line

  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
    required this.color, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color, // Use the provided color parameter here
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato-Bold.ttf',
                  ),
                ),
        ),
      ),
    );
  }
}
