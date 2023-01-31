import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Ou"),
        const SizedBox(
          height: tFormHeigth - 19,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeigth - 20,
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: tSignUp, style: TextStyle(color: Colors.blue))
                ])))
      ],
    );
  }
}
