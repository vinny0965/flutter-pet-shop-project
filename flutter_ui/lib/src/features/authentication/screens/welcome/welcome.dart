import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(tWelcomeSreenImage),
            height: heigth * 0.6,
          ),
          Column(
            children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                tWelcomeSubtitle,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                  onPressed: () {}, child: Text(tLogin.toUpperCase())),
              ElevatedButton(
                  onPressed: () {}, child: Text(tSignUp.toUpperCase()))
            ],
          )
        ],
      ),
    ));
  }
}
