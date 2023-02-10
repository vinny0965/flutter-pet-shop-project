import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/core/controllers/agendamento_controller.dart';
import 'package:flutter_ui/src/features/core/models/agendamento_model.dart';
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
          "Agendamentos Realizados",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<List<AgendamentoModel>>(
            future: controller.getAgendamentoData(),
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
                              leading: const Icon(LineAwesomeIcons.calendar),
                              title: Text(
                                  "Agendamento: ${snapShot.data![index].servico}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Data: ${snapShot.data![index].data}"),
                                  Text(
                                      "Horario: ${snapShot.data![index].horario}"),
                                  Text("Valor: ${snapShot.data![index].valor}"),
                                ],
                              ),
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
