

import 'package:elevate_ecommerce_driver/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Regular Text Style
  static TextStyle regular({
    Color? color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? AppSize.s14,
        fontWeight: fontWeight,
      ),
    );
  }

  // Title Text Style (for product titles, headings)
  static TextStyle title({
    Color? color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? AppSize.s16,
        fontWeight: fontWeight,
      ),
    );
  }

  // Subtitle Text Style (for descriptions, smaller text)
  static TextStyle subtitle({
    Color? color = Colors.black54,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.black54,
        fontSize: fontSize ?? AppSize.s12,
        fontWeight: fontWeight,
      ),
    );
  }

  // Price Text Style (for displaying prices, highlighting important text)
  static TextStyle price({
    Color? color = Colors.pink,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.pink,
        fontSize: fontSize ?? AppSize.s14,
        fontWeight: fontWeight,
      ),
    );
  }

  // Button Text Style (for buttons like "Add to Cart", etc.)
  static TextStyle button({
    Color? color = Colors.white,
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? AppSize.s14,
        fontWeight: fontWeight,
      ),
    );
  }

  // Search Text Style
  static TextStyle search({
    Color? color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? AppSize.s14,
        fontWeight: fontWeight,
      ),
    );
  }
}
