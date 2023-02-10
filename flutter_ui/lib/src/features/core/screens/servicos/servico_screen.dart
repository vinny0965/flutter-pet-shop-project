import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/profile_controller.dart';

class ServicoScreen extends StatelessWidget {
  const ServicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tColorInicial,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          "Agendamento Serviços",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          width: 700,
          child: Column(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ServicoSliderWidget(
                    textTheme: textTheme,
                    title: "Agendamento de Vacinas",
                    title1: "5 Variantes de Vacina",
                    image: tVacina,
                    subTitle: "Mantenha atualizada a carteirinha de vacinação",
                  ),
                  ServicoSliderWidget(
                    textTheme: textTheme,
                    title: "Agendamento de Vacinas",
                    title1: "5 Variantes de Vacina",
                    image: tVacina,
                    subTitle: "Mantenha atualizada a carteirinha de vacinação",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicoSliderWidget extends StatelessWidget {
  const ServicoSliderWidget(
      {super.key,
      required this.textTheme,
      required this.title,
      required this.title1,
      required this.subTitle,
      required this.image});

  final TextTheme textTheme;

  final String title;
  final String title1;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: textTheme.headline4,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Image(
                        image: AssetImage(image),
                        height: 110,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        onPressed: () {},
                        child: Icon(Icons.start)),
                    const SizedBox(
                      width: tDashboardCardPadding,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title1,
                            style: textTheme.headline4,
                          ),
                          Text(
                            subTitle,
                            style: textTheme.bodyText1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
