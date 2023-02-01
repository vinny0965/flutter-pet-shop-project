import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/sizes.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(
                height: tDefaultSize * 4,
              ),
              const FormHeaderWidget(
                image: tForgetPasswordImage,
                title: tForgetPassword,
                subtitle: tForgetPasswordSubtitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heigthBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tFormHeigth,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(tEmail),
                      hintText: tEmail,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Próximo")))
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
