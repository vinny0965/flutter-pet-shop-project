import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/features/authentication/models/user_model.dart';
import 'package:flutter_ui/src/features/core/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/color.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                if (snapShot.hasData) {
                  UserModel userData = snapShot.data as UserModel;
                  return Column(children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage(tProfileImage))),
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
                          initialValue: userData.fullName,
                          decoration: InputDecoration(
                              label: Text(tFullName),
                              prefixIcon: Icon(LineAwesomeIcons.user)),
                        ),
                        const SizedBox(
                          height: tFormHeigth - 20,
                        ),
                        TextFormField(
                          initialValue: userData.email,
                          decoration: InputDecoration(
                              label: Text(tEmail),
                              prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                        ),
                        const SizedBox(
                          height: tFormHeigth - 20,
                        ),
                        TextFormField(
                          initialValue: userData.phoneNo,
                          decoration: InputDecoration(
                              label: Text(tPhoneN),
                              prefixIcon: Icon(LineAwesomeIcons.phone)),
                        ),
                        const SizedBox(
                          height: tFormHeigth - 20,
                        ),
                        TextFormField(
                          initialValue: userData.password,
                          decoration: InputDecoration(
                              label: Text(tSenha),
                              prefixIcon: Icon(LineAwesomeIcons.fingerprint)),
                        ),
                        const SizedBox(
                          height: tFormHeigth,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(const UpdateProfileScreen()),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: const Text(
                                tEditProfile,
                                style: TextStyle(color: tDarkColor),
                              )),
                        ),
                        const SizedBox(
                          height: tFormHeigth,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(TextSpan(
                                text: tJoined,
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: tJoinedAt,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))
                                ])),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(tDelete),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                            )
                          ],
                        )
                      ],
                    ))
                  ]);
                } else if (snapShot.hasError) {
                  return Center(
                    child: Text(snapShot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
