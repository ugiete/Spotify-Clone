import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotify_clone/pages/sign_up/email_step.dart';
import 'package:spotify_clone/pages/sign_up/name_step.dart';
import 'package:spotify_clone/pages/sign_up/password_step.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  int step = 0;

  void goBack() {
    if (step == 0) {
      Navigator.of(context).pop();
    } else {
      switch (step) {
        case 1:
          passwordController.clear();
          break;
        
        case 2:
          nameController.clear();
          break;

        default:
          break;
      }

      setState(() {
        step--;
      });
    }
  }

  void goForward() {
    setState(() {
      step++;
    });
  }

  void save(bool sendNews, bool shareData) {
    debugPrint(jsonEncode({
      'email': emailController.text,
      'password': passwordController.text,
      'name': nameController.text,
      'news': sendNews,
      'share': shareData
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212).withAlpha(220),
          automaticallyImplyLeading: false,
          title: Text(
            AppLocalizations.of(context)!.createAccountHeader,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: goBack,
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16)
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: switch (step) {
              0 => SignUpEmailStep(controller: emailController, onNext: goForward),
              1 => SignUpPasswordStep(controller: passwordController, onNext: goForward),
              2 => SignUpNameStep(controller: nameController, onNext: save),
              int() => SignUpEmailStep(controller: emailController, onNext: goForward)
            }
          ),
        ),
      ),
    );
  }
}