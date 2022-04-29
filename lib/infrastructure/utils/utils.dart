import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class Utils {
  static final Utils _instance = Utils._internal();

  factory Utils() {
    return _instance;
  }

  Utils._internal();

  //final dbHelper = DatabaseHelper.instance;

  //static UserModel userModel = UserModel();

  static bool isWindowTimeToNotification(
      {required String acordar, required String dormir}) {
    var hour = DateTime.now().hour.toString();
    var minuto = DateTime.now().minute < 10
        ? '0${DateTime.now().minute.toString()}'
        : DateTime.now().minute.toString();

    var somaNow = int.parse('$hour$minuto');
    var somaDormir = int.parse('${dormir.substring(0,2)}${dormir.substring(3,5)}');
    var somaAcordar = int.parse('${acordar.substring(0,2)}${acordar.substring(3,5)}');

    if (somaNow < somaDormir && somaNow > somaAcordar) {
      return true;
    } else {
      return false;
    }
  }

  // static Future<bool> validarNotification() async {
  //   var isValid = false;
  //   var _controller = HidrateseController();
  //   UserModel _user = await _controller.getPerfil();
  //   if (isWindowTimeToNotification(
  //       acordar: _user.acordar!, dormir: _user.dormir!)) {
  //     //checa se esta dentro do horário
  //     if (checkAlcancouMetaDiaria(_user)) {
  //       //checa se a meta diaria de ingestão de água ja foi alcançada
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       if (!prefs.getBool('cancelNotification')!) {
  //         //Se a meta foi alcançada verifica se continua a notificar ate o horario de dormir.
  //         isValid = true;
  //       }
  //     }
  //   }

  //   return isValid;
  // }

  // static void showNotification() async {
  //   UserController userController = Get.put(UserController());
  //   UserModel userModel = await userController.getPerfil();

  //   DateTime dtAcordar = addTimeToDateNow(userModel.acordar!);
  //   DateTime dtDormir = addTimeToDateNow(userModel.dormir!);

  //   Logger().d('DateNow ', DateTime.now().toString());

  //   if (DateTime.now().isAfter(dtAcordar) &&
  //       DateTime.now().isBefore(dtDormir)) {
  //     // AwesomeNotifications().createNotification(
  //     //   content: NotificationContent(
  //     //       id: 1,
  //     //       channelKey: 'key1',
  //     //       title: 'Hidratese',
  //     //       body: 'This is Body of Notification',
  //     //       bigPicture:
  //     //           'asset://assets/images/bigwater.png', //'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.lifewire.com%2Fthmb%2FT5DT9cWrpIbtxa1KUJyo5dZ0UQE%3D%2F1280x853%2Ffilters%3Ano_upscale()%3Amax_bytes(150000)%3Astrip_icc()%2Fpixlr-e-editor-c17451ffb95344c5918221a240934613.png&imgrefurl=https%3A%2F%2Fwww.lifewire.com%2Ffree-online-photo-editors-1357096&tbnid=EaUyc98FGFHlgM&vet=12ahUKEwiz_pCDo7f1AhV9N7kGHU4eBZgQMygCegUIARC6AQ..i&docid=A7waVqT59qdKtM&w=1280&h=853&itg=1&q=image%20online%20editor&ved=2ahUKEwiz_pCDo7f1AhV9N7kGHU4eBZgQMygCegUIARC6AQ',
  //     //       notificationLayout: NotificationLayout.BigPicture,
  //     //       displayOnBackground: true,
  //     //       displayOnForeground: true,
  //     //       wakeUpScreen: true,
  //     //       category: NotificationCategory.Reminder,
  //     //       backgroundColor: Color(Utils.getColorFromHex('#173447')),
  //     //       criticalAlert: true,
  //     //       fullScreenIntent: true,
  //     //       customSound: 'assets://assets/sounds/AwesomemorningAlarm.mp3'),
  //     // );
  //   }
  // }

  // static bool checkAlcancouMetaDiaria(UserModel user) {
  //   var _controller = HidrateseController();
  //   // ignore: unrelated_type_equality_checks
  //   if (_controller.quantidadeTomada.value >=
  //       double.parse(user.litros ?? '0.0')) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  static Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(getColorFromHex('#173447'));
    }
    return Color(getColorFromHex('#173447'));
  }

  static double aplicarProporcaoAurea(double valor) {
    return valor / 1.1618;
  }

  static double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static String dataFormat(DateTime date) {
    return DateFormat("yyyy-MM-dd HH:mm").format(date);
  }

  static String dataFormatOnlyDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static int getHour(DateTime date) {
    return int.parse(DateFormat('HH').format(date));
  }

  static DateTime addTimeToDateNow(String time) {
    String dateNow = dataFormatOnlyDate(DateTime.now());
    String dateAndTime = dateNow + ' ' + time;

    return DateTime.parse(dateAndTime);
  }

  static int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(4);
  }

  static Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  // ignore: prefer_typing_uninitialized_variables
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}