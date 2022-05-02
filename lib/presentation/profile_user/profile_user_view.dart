import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  final _perfilController = Get.find<ProfileUserController>();

  _pickTime(BuildContext context, String modo) async {
    TimeOfDay? time = await showTimePicker(
        helpText: modo.toUpperCase(),
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (time != null) {
      var h = time.hour > 10
          ? '${time.hour.toString()}'
          : '0${time.hour.toString()}';
      var m = time.minute > 10
          ? '${time.minute.toString()}'
          : '0${time.minute.toString()}';
      _perfilController.updateTime(modo, h, m);
    }
  }

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
              CustomText(
                  text:
                      'Estas informações serão gravadas apenas em seu dispositivo'),
              SizedBox(
                height: 45,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Gênero'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FlutterSwitch(
                        activeText: "Masculino",
                        inactiveText: "Femenino",
                        inactiveColor: Colors.pink,
                        value: _perfilController.sexo.value,
                        valueFontSize: 12.0,
                        width: 110,
                        borderRadius: 30.0,
                        showOnOff: true,
                        onToggle: (val) {
                          _perfilController.sexo.value = val;
                        },
                      ),
                    )
                  ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Peso: '),
                  Expanded(
                    child: Slider(
                      value: _perfilController.peso.value,
                      min: 0,
                      max: 120,
                      divisions: 120,
                      label: _perfilController.peso.value.round().toString(),
                      onChanged: (value) {
                        _perfilController.peso.value = value;
                      },
                    ),
                  ),
                  CustomText(
                      text: _perfilController.peso.value.round().toString())
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: 'Acordar: '),
                  Expanded(
                    child: TextField(
                        readOnly: true,
                        style: GoogleFonts.quicksand(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        controller: _perfilController.acordarEditController,
                        onTap: () => _pickTime(context, 'acordar')),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: 'Dormir: '),
                  Expanded(
                    child: TextField(
                        readOnly: true,
                        style: GoogleFonts.quicksand(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        // keyboardType: TextInputType.number,
                        controller: _perfilController.dormirEditController,
                        onTap: () => _pickTime(context, 'dormir')),
                  ),
                ],
              ),
              SizedBox(
                height: 30
              ),
              Center(
                child: OutlinedButton(
                  child: CustomText(text: 'Adcionar'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  onPressed: () => _perfilController.addPerfil(),
                ),
              )
            ],
          ),
        ));
  }
}
