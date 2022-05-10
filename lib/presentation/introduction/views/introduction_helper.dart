import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/external/handler_native_code/handler_native_code.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';
import 'package:hidratese/presentation/dayle_param/controllers/dayle_param_controller.dart';
import 'package:hidratese/presentation/home/views/home.screen.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'pages.dart';

enum Devices {
  xiaomi,
  letv,
  asusrog,
  honor,
  huawei,
  oppo,
  vivo,
  nokia,
  samsung,
  oneplus
}

class IntroductioHelper extends StatelessWidget {
  IntroductioHelper({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final _param = Get.find<DayleParamController>();
    final _perfilController = Get.put(ProfileUserController());

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: IntroductionScreen(
          scrollPhysics:
              const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
          pages: Pages.pageViews,
          //List of PageViewModel

          rawPages: [
            //If you don't want to use PageViewModel you can use this
          ],
          //If you provide both rawPages and pages parameter, pages will be used.
          onChange: (e) {
            // print('------------------$e');
            // When something changes
          },
          onDone: () async {
            print('Alguma coisa');
            await _perfilController.addPerfil();
            await _param.addPeso();
            await _param.addLifeStyle();
            await _param.addHumidade();
            await _param.addTemperatura();
            Get.offAll(() => HomeScreen());
          },
          onSkip: () {
            // You can also override onSkip callback
          },
          next: CustomText(text: 'Próximo'),

          showSkipButton: false, //Is the skip button should be display
          skip: const Icon(Icons.skip_next),
          // next: const Icon(Icons.forward),
          //showDoneButton: false,
          done: CustomText(text: 'Finalizar'),

          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Theme.of(context).progressIndicatorTheme.color,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }

  Future appPermissionDefaultDialog(String device) {
    return Get.defaultDialog(
        title: "Hidratese",
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
        confirm: TextButton(
            onPressed: (() {
              Get.back();
            }),
            child: CustomText(text: 'OK')));
  }

  
}
