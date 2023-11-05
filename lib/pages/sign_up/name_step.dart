import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/sign_up/text_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpNameStep extends StatefulWidget {
  final TextEditingController controller;
  final void Function(bool, bool) onNext;

  const SignUpNameStep({super.key, required this.controller, required this.onNext});

  @override
  State<SignUpNameStep> createState() => _SignUpNameStepState();
}

class _SignUpNameStepState extends State<SignUpNameStep> {
  bool sendNews = false;
  bool shareData = false;

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
          title: AppLocalizations.of(context)!.nameInputTitle,
          message: AppLocalizations.of(context)!.nameInputMessage,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(
            color: Color(0xFF777777),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.termsOfUseDisclaimer,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            AppLocalizations.of(context)!.termsOfUse,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 10
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            AppLocalizations.of(context)!.privacyPolicyDisclaimer,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            AppLocalizations.of(context)!.privacyPolicy,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 10
            )
          ),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: sendNews,
          title: Text(
            AppLocalizations.of(context)!.sendNewsMessage,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10
            )
          ),
          fillColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
              ? Colors.greenAccent
              : null;
          }),
          side: const BorderSide(color: Colors.white),
          checkColor: Colors.greenAccent,
          checkboxShape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              sendNews = value ?? false;
            });
          }
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: shareData,
          title: Text(
            AppLocalizations.of(context)!.shareDataDisclaimer,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10
            )
          ),
          fillColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.selected)
              ? Colors.greenAccent
              : null;
          }),
          side: const BorderSide(color: Colors.white),
          checkColor: Colors.greenAccent,
          checkboxShape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              shareData = value ?? false;
            });
          }
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: widget.controller.text.isEmpty
              ? null
              : () => widget.onNext(sendNews, shareData),
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: const Color(0xFF535353),
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
            child: Text(
              AppLocalizations.of(context)!.createAccountButton,
              style: const TextStyle(color: Color(0xFF121212))
            )
          ),
        )
      ]
    );
  }
}