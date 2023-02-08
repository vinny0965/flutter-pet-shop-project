import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/authentication/controllers/otp_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OTPController otpController = OTPController();
    var otp;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 70.0),
            ),
            Text(
              tOtpSubtitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              tOtpMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onChanged: (pin) {
                otp = pin;
              },
              onCompleted: (pin) {
                otp = pin;
                otpController.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      otpController.verifyOTP(otp);
                    },
                    child: Text("Próximo")))
          ],
        ),
      ),
    );
  }
}
