import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                    image: tWelcomeSreenImage,
                    title: tSignUpTitle,
                    subtitle: tSignUpSubTitle),
                const SignUpWidget(),
                Column(
                  children: [
                    const Text("Ou"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        label: Text(tSignInWithGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: tAlredyHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyText1),
                          TextSpan(text: tLogin.toUpperCase())
                        ])))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
