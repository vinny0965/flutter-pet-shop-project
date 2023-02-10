import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/features/core/models/servicos_list_model.dart';
import 'package:flutter_ui/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_ui/src/features/core/screens/servicos/servicos_model_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/profile_controller.dart';
import '../../models/endereco_model.dart';

class ServicoScreenCopy extends StatelessWidget {
  const ServicoScreenCopy({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProfileController());
    var servico = "";
    var valor = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tOnBoardingPage1Color,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              LineAwesomeIcons.angle_left,
              color: Colors.black,
            )),
        title: Text(
          "Agendamento Serviços",
          style: Theme.of(context).textTheme.headline4,
          selectionColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<List<ServicoListModel>>(
              future: controller.getServicoList(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.done) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(20),
                        shrinkWrap: true,
                        itemCount: snapShot.data!.length,
                        itemBuilder: (c, index) {
                          return ServicoSliderWidget(
                            textTheme: textTheme,
                            title: snapShot.data![index].msg,
                            title1: snapShot.data![index].tipo,
                            subTitle:
                                Text('Valor: ${snapShot.data![index].valor}'),
                            image: tSplashImage,
                            onPressed: () {
                              servico = snapShot.data![index].tipo;
                              valor = snapShot.data![index].valor;
                              ServicosBottonSheet.buildShowModalBottomSheet(
                                  context, servico, valor);
                            },
                          );
                        });
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
              })),
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
      required this.image,
      required this.onPressed});

  final TextTheme textTheme;

  final String title;
  final String title1;
  final Text subTitle;
  final String image;
  final VoidCallback onPressed;

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
                        onPressed: onPressed,
                        child: Icon(Icons.view_agenda_outlined)),
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
                          subTitle,
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
