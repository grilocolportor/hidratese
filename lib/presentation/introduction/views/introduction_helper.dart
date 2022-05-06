import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/infrastructure/navigation/routes.dart';
import 'package:hidratese/presentation/dayle_param/controllers/dayle_param_controller.dart';
import 'package:hidratese/presentation/home/views/home.screen.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'pages.dart';

class IntroductioHelper extends StatelessWidget {
  const IntroductioHelper({Key? key}) : super(key: key);

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
            Get.off(() => HomeScreen());
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
}
