import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/infrastructure/theme/dark/theme_dark.dart';
import 'package:hidratese/infrastructure/theme/light/theme_light.dart';
import 'package:hidratese/presentation/introduction/views/profile_user_view.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Pages {
  static List<PageViewModel> pageViews = [
    PageViewModel(
      title: 'Welcome to Hidratese', //Basic String Title
      // titleWidget: const Text(
      //     'Title of 1st Page'), //If you want to use your own Widget
      // body: 'Body of 1st Page', //Basic String Body
      bodyWidget: FirstPage(), //If you want to use your own Widget
      decoration:
          const PageDecoration(), //Page decoration Contain all page customizations
      //  image: Center(
      //   child: Image.network(
      //       'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi'),
      //  ), //If you want to you can also wrap around Alignment
      //reverse: true, //If widget Order is reverse - body before image
      // footer: const Text('Footer'), //You can add button here for instance
    ),
    PageViewModel(
      title: 'Atenção', //Basic String Title
      // titleWidget: const Text('Atenção'),
      //     'Title of 1st Page'), //If you want to use your own Widget
      // body: 'Body of 1st Page', //Basic String Body
      bodyWidget: ProfileUserView(),
      //const Text('Body of 1st Page'), //If you want to use your own Widget
      decoration:
          const PageDecoration(), //Page decoration Contain all page customizations
      // image: Center(
      //   child: Image.network(
      //       'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi'),
      // ), //If you want to you can also wrap around Alignment
      // reverse: true, //If widget Order is reverse - body before image
      // footer: const Text('Footer'), //You can add button here for instance
    ),
  ];
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              child: CustomText(
                  text:
                      ' Beber água pode ter diversos benefícios para a saúde, uma vez que é essencial para várias funções no corpo. Além de ajudar a manter a pele e cabelos saudáveis e ajudar a regular o intestino, diminuindo a prisão de ventre, manter uma boa ingestão de líquidos também tem outros benefícios para o equilíbrio do organismo que são muito importantes para a manutenção da saúde em geral.')),
        ),
        TextButton(
            onPressed: () {
              Get.changeTheme(
                Get.isDarkMode ? themeDatalight : themeDataDark,
              );
            },
            child: Text('Click aAqui'))
      ],
    );
  }
}
