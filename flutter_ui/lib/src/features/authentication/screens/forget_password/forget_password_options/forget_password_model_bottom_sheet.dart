import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_email/forget_password_mail.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgetPasswordTitle,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    tForgetPasswordSubtitle,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 11.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mail_outline_rounded,
                    tile: tEmail,
                    subTitle: tResetViaEmail,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(ForgetPasswordMailScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    tile: tPhoneN,
                    subTitle: tResetViaCel,
                    onTap: () {},
                  ),
                ],
              ),
            ));
  }
}
