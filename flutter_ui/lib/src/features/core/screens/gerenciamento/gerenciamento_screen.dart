import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/core/models/endereco_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/color.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../models/user_model.dart';
import '../../controllers/profile_controller.dart';
import '../profile/update_profile_screen.dart';

class GerenciamentoScreen extends StatelessWidget {
  const GerenciamentoScreen({super.key});

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
          child: FutureBuilder<List<EnderecoModel>>(
            future: controller.getEnderecoData(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapShot.data!.length,
                      itemBuilder: (c, index) {
                        return Column(
                          children: [
                            ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
                              leading: const Icon(LineAwesomeIcons.user_1),
                              title: Text(
                                  "Cidade: ${snapShot.data![index].cidade}"),
                              // subtitle: Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(snapShot.data![index].phoneNo),
                              //     Text(snapShot.data![index].email),
                              //   ],
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
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
            },
          ),
        ),
      ),
    );
  }
}
