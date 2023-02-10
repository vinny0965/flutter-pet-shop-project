import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/core/models/servico_model.dart';
import 'package:flutter_ui/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter_ui/src/features/core/screens/servicos/servico_screen.dart';
import 'package:flutter_ui/src/features/core/screens/servicos/servico_screen_copy.dart';
import 'package:flutter_ui/src/features/core/screens/servicos/servicos_model_bottom_sheet.dart';
import 'package:flutter_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: tColorInicial,
        title: Text(
          tAppName,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tColorInicial),
            child: IconButton(
                onPressed: () {
                  Get.to(() => const ProifleScreen());
                  // AuthenticationRepository.instance.logout();
                },
                icon: const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              tDashBoardTitle,
              style: textTheme.bodyText2,
            ),
            Text(tDashboardHeading, style: textTheme.headline2),
            const SizedBox(
              height: tDashboardPadding,
            ),

            //caixa de pesquisa
            Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4))),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tDashBoardingSearch,
                      style: textTheme.headline2
                          ?.apply(color: Colors.grey.withOpacity(0.5))),
                  const Icon(
                    Icons.mic,
                    size: 25,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            //categorias
            Column(
              children: [
                Container(
                    child: FutureBuilder(
                  future: controller.getServicoData(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.done) {
                      if (snapShot.hasData) {
                        ServicoModel userData = snapShot.data as ServicoModel;
                        final servico =
                            TextEditingController(text: userData.servico);
                        final tipo = TextEditingController(text: userData.tipo);
                        return SizedBox(
                          height: 45,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: tDarkColor),
                                      child: Center(
                                        child: Text(
                                          servico.text,
                                          style: textTheme.headline6
                                              ?.apply(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            tipo.text,
                                            style: textTheme.headline6,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "7 Serviços",
                                            style: textTheme.bodyText2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: tDarkColor),
                                      child: Center(
                                        child: Text(
                                          "GT",
                                          style: textTheme.headline6
                                              ?.apply(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Gatos",
                                            style: textTheme.headline6,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "7 Serviços",
                                            style: textTheme.bodyText2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: tDarkColor),
                                      child: Center(
                                        child: Text(
                                          "GT",
                                          style: textTheme.headline6
                                              ?.apply(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Gatos",
                                            style: textTheme.headline6,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "7 Serviços",
                                            style: textTheme.bodyText2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapShot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
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
                ))
              ],
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tCardBgColor),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child:
                                    Image(image: AssetImage(tVeterinarioImage)))
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          tDashboardBannerTitle1,
                          style: textTheme.headline4,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          tDashboardingSubtitle,
                          style: textTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: tDashboardCardPadding,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: tCardBgColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Flexible(
                                  child: Image(
                                      image:
                                          AssetImage(tVeterinarioPrachImage)))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            tDashboardBannerTitle2,
                            style: textTheme.headline4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            tDashboardingSubtitle2,
                            style: textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const ServicoScreenCopy());
                          },
                          child: Text(tDashBoardButtonText)),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            Text(
              tDashboardTopAtendimentos,
              style: textTheme.headline4?.apply(fontSizeFactor: 1.2),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 320,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: tCardBgColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Agendamento de Vacinas",
                                  style: textTheme.headline4,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: const Image(
                                  image: AssetImage(tVacina),
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
                                      "5 Variantes de Vacina",
                                      style: textTheme.headline4,
                                    ),
                                    Text(
                                      "Mantenha atualizada a carteirinha de vacinação",
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
                  SizedBox(
                    width: 320,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Agendamento de Vacinas",
                                    style: textTheme.headline4,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: const Image(
                                    image: AssetImage(tVacina),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "5 Variantes de Vacina",
                                        style: textTheme.headline4,
                                      ),
                                      Text(
                                        "Mantenha atualizada a carteirinha de vacinação",
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
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
