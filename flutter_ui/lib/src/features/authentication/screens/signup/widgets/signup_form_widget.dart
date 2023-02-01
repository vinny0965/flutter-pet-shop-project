import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeigth - 10),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_rounded)),
          ),
          const SizedBox(
            height: tFormHeigth - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(tEmail), prefixIcon: Icon(Icons.email_rounded)),
          ),
          const SizedBox(
            height: tFormHeigth - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(tPhoneN), prefixIcon: Icon(Icons.numbers)),
          ),
          const SizedBox(
            height: tFormHeigth - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text(tSenha), prefixIcon: Icon(Icons.fingerprint)),
          ),
          const SizedBox(
            height: tFormHeigth - 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text(tSignUp.toUpperCase())),
          )
        ],
      )),
    );
  }
}
