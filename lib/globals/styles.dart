import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final TextStyle head = GoogleFonts.inter(
    textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 125));
final TextStyle smallHead = GoogleFonts.inter(
    textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 80));
final TextStyle text = GoogleFonts.inter(
    textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 20));
final TextStyle smallText = GoogleFonts.inter(
    textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 17));

final TextStyle headWhite = GoogleFonts.inter(
    textStyle: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 125, color: Colors.white));
final TextStyle smallHeadWhite = GoogleFonts.inter(
    textStyle: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 75, color: Colors.white));
final TextStyle textWhite = GoogleFonts.inter(
    textStyle: TextStyle(
        fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white));
final TextStyle smallTextWhite = GoogleFonts.inter(
    textStyle: TextStyle(
        fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white));

Color backGr = Color(0xFFF5F5F5); 
Color cardBack = Colors.white;
Color desaturatedRed = Color(0xFFE53935);
const Color darkGrey = Color(0xFF212121);
Color trueBlack = Colors.black;
Color trueWhite = Colors.white;

final InputDecoration textFieldDeco = InputDecoration(
  border: InputBorder.none,
  fillColor: Colors.grey[200],
  filled: true,
);

final boxShadow = [
  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10)
];