import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeigth - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: tFormHeigth - 20),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tSenha,
                hintText: tSenha,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
          ),
          const SizedBox(height: tFormHeigth - 20),
          Align(
              alignment: Alignment.centerRight,
              child:
                  TextButton(onPressed: () {}, child: Text(tForgetPassword))),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text(tLogin.toUpperCase())),
          )
        ],
      ),
    ));
  }
}
