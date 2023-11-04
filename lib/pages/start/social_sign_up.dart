import 'package:flutter/material.dart';

class SocialSignUpButton extends StatelessWidget {
  final String icon;
  final String child;
  final void Function() onPressed;

  const SocialSignUpButton({super.key, required this.icon, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(45)
        ),
        minimumSize: const Size.fromHeight(kMinInteractiveDimension)
      ),
      child: Stack(
        children: [
          Image.asset(icon),
          Center(
            child: Text(
              child,
                style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
            ),
          ),
        ],
      )
    );
  }
}