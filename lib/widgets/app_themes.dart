// Builtin & ThirdParty Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Made Imports
import 'package:todolist_with_firebase/utils/utility_functions.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.indigo,
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: Colors.grey[200]
      // appBarTheme: AppBarTheme(),
    );
  }

  static ThemeData darkTheme(BuildContext context) {  
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      // appBarTheme: AppBarTheme()
    );
  } 

  // Colors
  static Color creamColor = Utils.getColorFromHex("#f5f5f5");
  static Color darkBluishColor = Utils.getColorFromHex("#403b58");
}