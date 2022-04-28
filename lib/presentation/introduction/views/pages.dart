import 'package:flutter/material.dart';
import 'package:hidratese/presentation/introduction/views/profile_user_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Pages  {

  static List<PageViewModel> pageViews = [
     PageViewModel(
        title: 'Welcome to Hidratese', //Basic String Title
        // titleWidget: const Text(
        //     'Title of 1st Page'), //If you want to use your own Widget
        // body: 'Body of 1st Page', //Basic String Body
        bodyWidget:
            const Text('Body of 1st Page'), //If you want to use your own Widget
        decoration:
            const PageDecoration(), //Page decoration Contain all page customizations
        image: Center(
          child: Image.network(
              'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi'),
        ), //If you want to you can also wrap around Alignment
        reverse: true, //If widget Order is reverse - body before image
        footer: const Text('Footer'), //You can add button here for instance
      ),

       PageViewModel(
        title: 'PAGE 2', //Basic String Title
        // titleWidget: const Text(
        //     'Title of 1st Page'), //If you want to use your own Widget
        // body: 'Body of 1st Page', //Basic String Body
        bodyWidget: ProfileUserView(),
            //const Text('Body of 1st Page'), //If you want to use your own Widget
        decoration:
            const PageDecoration(), //Page decoration Contain all page customizations
        image: Center(
          child: Image.network(
              'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi'),
        ), //If you want to you can also wrap around Alignment
        reverse: true, //If widget Order is reverse - body before image
        footer: const Text('Footer'), //You can add button here for instance
      ),
  ];

 
}


