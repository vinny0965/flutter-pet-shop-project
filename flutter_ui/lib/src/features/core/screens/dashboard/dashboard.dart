import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          tAppName,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
                onPressed: () {},
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

            SizedBox(
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
                              borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
            )
          ],
        ),
      )),
    );
  }
}
