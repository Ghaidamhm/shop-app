import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtiles extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underline;
  const TextUtiles({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
            decoration: TextDecoration.underline,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
