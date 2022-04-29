import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  const CustomText({Key? key, required this.text, this.size=0}) : super(key: key);
  final String text;
  final double? size;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    final double thisTextSize = MediaQuery.of(context).textScaleFactor;
    return Text(
      widget.text,
      style: GoogleFonts.quicksand(
        textStyle: Theme.of(context).textTheme.headline1,
        fontSize: widget.size ==0 ?  thisTextSize / .06 : thisTextSize / widget.size!,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
