import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/sign_up/text_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPasswordStep extends StatefulWidget {
  final TextEditingController controller;
  final void Function() onNext;

  const SignUpPasswordStep({super.key, required this.controller, required this.onNext});

  @override
  State<SignUpPasswordStep> createState() => _SignUpPasswordStepState();
}

class _SignUpPasswordStepState extends State<SignUpPasswordStep> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      children: [
        SignUpTextInput(
          controller: widget.controller,
          onChange: (String? value) {
            setState(() {});
          },
          title: AppLocalizations.of(context)!.passwordInputTitle,
          message: AppLocalizations.of(context)!.passwordInputMessage,
          hidden: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: widget.controller.text.length < 8
              ? null
              : widget.onNext,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: const Color(0xFF535353),
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
            child: Text(
              AppLocalizations.of(context)!.nextButton,
              style: const TextStyle(color: Color(0xFF121212))
            )
          ),
        )  
      ]
    );
  }
}