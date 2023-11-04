import 'package:flutter/material.dart';
import 'package:spotify_clone/app/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotify_clone/pages/start/social_sign_up.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  static String route = '/';

  void signUp() {}
  
  void logIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          Image.asset('$kAssetsImages/start_background.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('$kAssetsBrand/logo.png'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      AppLocalizations.of(context)!.slogan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)
                        ),
                        minimumSize: const Size.fromHeight(kMinInteractiveDimension)
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.signUpButton,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        )
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SocialSignUpButton(
                      child: AppLocalizations.of(context)!.googleSignUpButton,
                      icon: '$kAssetsSocial/google.png',
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SocialSignUpButton(
                      child: AppLocalizations.of(context)!.facebookSignUpButton,
                      icon: '$kAssetsSocial/facebook.png',
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SocialSignUpButton(
                      child: AppLocalizations.of(context)!.appleSignUpButton,
                      icon: '$kAssetsSocial/apple.png',
                      onPressed: () {},
                    ),
                  ),
                  TextButton(
                    onPressed: logIn,
                    child: Text(
                      AppLocalizations.of(context)!.logInButton,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      )
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}