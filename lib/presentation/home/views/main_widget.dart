// ignore: implementation_imports
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';
import 'package:hidratese/presentation/home/controllers/home.controller.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';

class MainWidget extends GetView<HomeController> {
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var thisTextSize = queryData.textScaleFactor;
    var thisHeight = queryData.size.height;
    var thisWidth = queryData.size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.transparent,
                  width: Utils.aplicarProporcaoAurea(thisWidth),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Obx(
                        () => CustomText(
                          text: '${_homeController.litrosMetaDia.value}ml',
                          size: thisTextSize / 30,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Obx(
                      //   () => SleekCircularSlider(
                      //     appearance: CircularSliderAppearance(
                      //         spinnerDuration: 5000,
                      //         infoProperties: InfoProperties(
                      //             bottomLabelText:
                      //                 '${_hidrateseController.quantidadeTomada.value.toInt()}ml',
                      //             bottomLabelStyle: GoogleFonts.quicksand(
                      //                 textStyle:
                      //                     Theme.of(context).textTheme.headline1,
                      //                 fontSize: 20,
                      //                 color: Colors.white),
                      //             mainLabelStyle: GoogleFonts.quicksand(
                      //                 textStyle:
                      //                     Theme.of(context).textTheme.headline1,
                      //                 fontSize: 90,
                      //                 color: Colors.white),
                      //             modifier: (double value) {
                      //               final roundedValue =
                      //                   value.ceil().toInt().toString();
                      //               return '$roundedValue%';
                      //             }),
                      //         size: 300,
                      //         customColors: CustomSliderColors(
                      //             dotColor: Colors.black,
                      //             trackColor: Colors.white,
                      //             //   shadowColor: Colors.white,
                      //             progressBarColor: Colors.white),
                      //         customWidths: CustomSliderWidths(
                      //             progressBarWidth: 5, shadowWidth: 15)),
                      //     min: 0,
                      //     max: 100,
                      //     initialValue: _hidrateseController.porcentagem.value,
                      //   ),
                      // ),
                      // Container(child: Expanded(child: listTodayDrink(context)))
                    ],
                  ),
                ),
                // WidgetSize(
                //   onChange: (Size size) {},
                //   child: Expanded(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         // Container(
                //         //   alignment: Alignment.topCenter,
                //         //   height: thisHeight / 2.5,
                //         //   color: Colors.transparent,
                //         //   child: LeftScreen(
                //         //     shadowOn: false,
                //         //     badgeOn: false,
                //         //     list: getIconsLists(),
                //         //     thisHeight: thisHeight,
                //         //   ),
                //         // ),
                //         // Container(
                //         //   alignment: Alignment.bottomCenter,
                //         //   color: Colors.transparent,
                //         //   height: thisHeight / 1.8,
                //         //   child: Padding(
                //         //     padding: const EdgeInsets.only(bottom: 8.0),
                //         //     child: Container(
                //         //         alignment: Alignment.bottomCenter,
                //         //         height: thisHeight / 1.5,
                //         //         color: Colors.transparent,
                //         //         child: listCups(context)),
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ]),
        ));
  }
}
