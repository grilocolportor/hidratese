// ignore: implementation_imports
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';
import 'package:hidratese/presentation/home/controllers/home.controller.dart';
import 'package:hidratese/presentation/widgets/custom_text.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await _homeController.incrementLitrosIngerido(200);
          await _homeController.resizeWave(thisHeight);
        }),
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
                        height: thisHeight / 10,
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
                      Obx(
                        () => SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              spinnerDuration: 5000,
                              infoProperties: InfoProperties(
                                  bottomLabelText:
                                      '${_homeController.litrosIngeridos.value.toInt()}ml',
                                  bottomLabelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 50),
                                  mainLabelStyle:  TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 50),
                                  modifier: (double value) {
                                    final roundedValue =
                                        value.ceil().toInt().toString();
                                    return '$roundedValue%';
                                  }),
                              size: 300,
                              customColors: CustomSliderColors(
                                  dotColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  trackColor: Theme.of(context).primaryColor,
                                  shadowColor: Theme.of(context).shadowColor,
                                  progressBarColor:
                                      Theme.of(context).primaryColor),
                              customWidths: CustomSliderWidths(
                                  progressBarWidth: 5, shadowWidth: 15)),
                          min: 0,
                          max: 100,
                          initialValue:
                              _homeController.litrosIngeridosPorcentagem.value,
                        ),
                      ),
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
