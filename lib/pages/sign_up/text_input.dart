import 'package:flutter/material.dart';

class SignUpTextInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String?) onChange;
  final String title;
  final String message;
  final bool hidden;

  const SignUpTextInput({super.key, required this.controller, required this.onChange, required this.title, this.message = '', this.hidden = false});

  @override
  State<SignUpTextInput> createState() => _SignUpTextInputState();
}

class _SignUpTextInputState extends State<SignUpTextInput> {
  bool obscureText = false;

  @override
  void initState() {
    if (widget.hidden) {
      obscureText = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            controller: widget.controller,
            onChanged: widget.onChange,
            cursorColor: Colors.greenAccent,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: const Color(0xFF777777),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
        ),
        if (widget.message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              widget.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600
              )
            ),
          )
      ],
    );
  }
}