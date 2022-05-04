import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidratese/infrastructure/theme/theme_service.dart';
import 'package:hidratese/infrastructure/utils/contants.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';

import '../controllers/dayle_param_controller.dart';

class DayleParamView extends GetView<DayleParamController> {
  final _dayleParamController = Get.find<DayleParamController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        //color: Color(Utils.getColorFromHex('#173447')),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // CustomText(
              //     text:
              //         'Estas informações serão gravadas apenas em seu dispositivo'),
              // SizedBox(
              //   height: 45,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Temp: '),
                  Expanded(
                    child: Slider(
                      value: _dayleParamController.temperatura.value.toDouble(),
                      min: -30,
                      max: 50,
                      divisions: 80,
                      label: _dayleParamController.temperatura.value
                          .round()
                          .toString(),
                      onChanged: (value) {
                        _dayleParamController.temperatura.value = value.toInt();
                      },
                    ),
                  ),
                  CustomText(
                      text: _dayleParamController.temperatura.value
                              .round()
                              .toString() +
                          'C')
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Humidade: '),
                  Expanded(
                    child: Slider(
                      value: _dayleParamController.humidade.value.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _dayleParamController.humidade.value
                          .round()
                          .toString(),
                      onChanged: (value) {
                        _dayleParamController.humidade.value = value.toInt();
                      },
                    ),
                  ),
                  CustomText(
                      text: _dayleParamController.humidade.value
                              .round()
                              .toString() +
                          '%')
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Estilo de Vida: '),
                  DropdownButton(
                      value: _dayleParamController.estiloVida.value,
                      items: <String>[
                        'Normal',
                        'Sendentário',
                        'Ativo',
                        'Muito Ativo'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: CustomText(
                            text: value,
                          ),
                        );
                      }).toList(),
                      onChanged: (v) {
                        _dayleParamController.changeDropDownLigeStyle(v.toString());
                      })
                ],
              )
            ],
          ),
        ));
  }
}
