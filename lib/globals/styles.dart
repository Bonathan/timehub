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

final backGr = Colors.grey[100];
final cardBack = Colors.white;
final desaturatedRed = Colors.red[600];
final darkGrey = Colors.grey[900];
final trueBlack = Colors.black;
final trueWhite = Colors.white;

final InputDecoration textFieldDeco = InputDecoration(
  border: InputBorder.none,
  fillColor: Colors.grey[200],
  filled: true,
);
