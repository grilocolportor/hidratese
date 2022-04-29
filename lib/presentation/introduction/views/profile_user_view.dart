import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';

import 'controllers/profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
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
      // switch (modo) {
      //   case 'dormir':
      //     _perfilController.dormirEditController.text = '$h:$m';
      //     _perfilController.dormir.value = '$h:$m';
      //     break;
      //   case 'acordar':
      //     _perfilController.acordarEditController.text = '$h:$m';
      //     _perfilController.acordar.value = '$h:$m';
      //     break;
      //   default:
      //     '';
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      //color: Color(Utils.getColorFromHex('#173447')),
      child: Column(
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
                    value: true, // _perfilController.sexo.value,
                    valueFontSize: 12.0,
                    width: 110,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      //  _perfilController.sexo.value = val;
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
                  value: 2.0, // _perfilController.peso.value,
                  min: 0,
                  max: 120,
                  divisions: 120,
                  label: 'YRSTRET', // _perfilController.peso.value
                  // .round()
                  // .toString(),
                  onChanged: (value) {
                    // _perfilController.peso.value = value;
                  },
                ),
              ),
              // customText(context, _perfilController.peso.value.round().toString())
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: 'Acordar: '),
              Expanded(
                child: TextField(
                    readOnly: true,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.right,
                    // //   //  keyboardType: TextInputType.number,
                    // controller: _perfilController.acordarEditController,
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
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.right,
                    // //   //  keyboardType: TextInputType.number,
                    //   controller: _perfilController.dormirEditController,
                    onTap: () => _pickTime(context, 'dormir')),
              ),
            ],
          )
        ],
      ),
    );
  }
}