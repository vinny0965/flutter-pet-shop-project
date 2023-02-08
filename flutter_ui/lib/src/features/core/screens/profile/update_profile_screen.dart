import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/color.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tProfileImage))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: tPrimaryColor,
                    ),
                    child: const Icon(
                      LineAwesomeIcons.camera,
                      size: 18.0,
                      color: Colors.black,
                      opticalSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tFullName),
                      prefixIcon: Icon(LineAwesomeIcons.user)),
                ),
                const SizedBox(
                  height: tFormHeigth - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tEmail),
                      prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                ),
                const SizedBox(
                  height: tFormHeigth - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tPhoneN),
                      prefixIcon: Icon(LineAwesomeIcons.phone)),
                ),
                const SizedBox(
                  height: tFormHeigth - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tSenha),
                      prefixIcon: Icon(LineAwesomeIcons.fingerprint)),
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}