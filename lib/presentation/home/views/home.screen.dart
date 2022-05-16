// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/external/handler_native_code/handler_native_code.dart';
import 'package:hidratese/presentation/home/views/main_widget.dart';
import 'package:hidratese/presentation/widgets/wavecontainer/wave_container.dart';
import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  var thisWidth = 0.0;
  var thisHeight = 0.0;

  final _homeController = Get.find<HomeController>();
  final _handleNativeCode = Injector.resolve<HandlerNativeCode>();

  initMethod(context) async {
    var showMessageConfig = await _homeController.isConfigured();

    await _homeController.checkPermission().then((value) async {
      if (value.isNotEmpty) {
        if (!showMessageConfig) {
          await appPermissionDefaultDialog(value);
          await addPermissionBackground(value);
          await addPermissionAutoStart(value);
          await finishedConfig();
        }
      }
    });

    await _homeController.getPeso();
    await _homeController.getEstiloVida();
    await _homeController.getHumidade();
    await _homeController.getTemperatura();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    thisHeight = queryData.size.height;
    thisWidth = queryData.size.width;

    WidgetsBinding.instance!.addPostFrameCallback((_) => initMethod(context));

    _homeController.resizeWave(thisHeight);

    return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder(
            future: _homeController.getLitrosMetaDiaria(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // if (snapshot.hasData) {
              return Stack(
                children: [
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Obx(
                            () => WaveContainer(
                              height: _homeController.resizeWaveHeight.value,
                              width: double.infinity,
                              waveColor: Colors.blueAccent,
                            ),
                          ))),
                  MainWidget()
                ],
              );
              // }
              // if (snapshot.hasError) {
              //   return Center(
              //     child: Padding(
              //       padding: EdgeInsets.only(top: 16.0),
              //       child: Text('Ops! Houve um error!!!\n${snapshot.error}'),
              //     ),
              //   );
              // } else {
              //   return Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           child: CircularProgressIndicator(),
              //           width: 60.0,
              //           height: 60.0,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(top: 16.0),
              //           child: Text('Awaiting result...'),
              //         )
              //       ],
              //     ),
              //   );
              // }
            },
          ),
        ));
  }

  Future addPermissionAutoStart(String device) async {
    if (device.toLowerCase().contains('xiaomi')) {
      await Get.defaultDialog(
          title: "Permissão para iniciar o lembrete ",
          middleText:
              "Para que possamos enviar um lembrete informando que esta na hora de se hidratar mesmo que você reenicie o despositivo, é necessário que você habilite essa permissão.\n Procure pelo aplicativo Hidratese na lista e habilite a opção",
          // titleStyle: GoogleFonts.quicksand(
          //     textStyle: Theme.of(context).textTheme.headline1,
          //     fontSize: thisTextSize / .09,
          //     fontWeight: FontWeight.bold,
          //     color: Color(Utils.getColorFromHex('#173447'))),
          // middleTextStyle: TextStyle(
          //     color: Color(Utils.getColorFromHex('#173447'))),
          confirm: TextButton(
              onPressed: (() async {
                await _handleNativeCode.setAutoStart();
                Get.back();
              }),
              child: Text('OK')));
    }
  }

  Future addPermissionBackground(String device) async {
    if (device.toLowerCase().contains('xiaomi')) {
      await Get.defaultDialog(
          title: "Permissão para mostrar opções em segundo plano",
          middleText:
              "Para que possamos enviar um lembrete informando que esta na hora de se hidratar é necessário que você habilite essa permissão.\n Marque todas as opções",
          // titleStyle: GoogleFonts.quicksand(
          //     textStyle: Theme.of(context).textTheme.headline1,
          //     fontSize: thisTextSize / .09,
          //     fontWeight: FontWeight.bold,
          //     color: Color(Utils.getColorFromHex('#173447'))),
          // middleTextStyle: TextStyle(
          //     color: Color(Utils.getColorFromHex('#173447'))),
          confirm: TextButton(
              onPressed: (() async {
                await _handleNativeCode.setPermission();
                Get.back();
              }),
              child: Text('OK')));
    }
  }

  Future appPermissionDefaultDialog(String device) async {
    return Get.defaultDialog(
        title: "Atenção",
        barrierDismissible: false,
        middleText:
            "Dispostivos da marca $device precisa de algumas configurações para uma melhor experiência ao usar o nosso aplicativo",
        // backgroundColor: Colors.white,
        // titleStyle: GoogleFonts.quicksand(
        //    // textStyle: Theme.of(context).textTheme.headline1,
        //     //fontSize: thisTextSize / .09,
        //     fontWeight: FontWeight.bold,
        //     color: Color(Utils.getColorFromHex('#173447'))),
        // middleTextStyle:
        //     TextStyle(color: Color(Utils.getColorFromHex('#173447'))),
        // confirm: TextButton(
        //     onPressed: (() {
        //       Get.back();
        //     }),
        //     child: CustomText(text: 'OK'))
        confirm: TextButton(
            onPressed: (() {
              Get.back();
            }),
            child: Text('OK')));
  }

  Future finishedConfig() async {
    return Get.defaultDialog(
        title: "Hidratese",
        barrierDismissible: false,
        middleText:
            "As configurações foram atualizadas com sucesso!!!.\nClick em ok para continar",
        confirm: TextButton(
            onPressed: (() {
              _homeController.setAlreadyConfig();
              Get.back();
            }),
            child: Text('OK')));
  }
}
