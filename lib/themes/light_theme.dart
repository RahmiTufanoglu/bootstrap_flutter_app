import 'package:flutter/material.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/utils/colors.dart';
import 'package:form_app/utils/fonts.dart';

ThemeData get appLightTheme {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      textStyleExtensionLight,
    ],

    // TODO(Rahmi): for some reason the back button icon color does not work with Material3
    useMaterial3: false,

    //brightness: Brightness.light,
    fontFamily: AppFonts.dosis,

    primaryColor: Colors.tealAccent,
    secondaryHeaderColor: Colors.pink,

    /// Background color
    canvasColor: AppColors.background,
    dialogBackgroundColor: AppColors.content,

    indicatorColor: Colors.black,

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,

    /// Card
    cardTheme: const CardTheme(
      color: Colors.green,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),

    /// AppBar
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      //toolbarHeight: 40,
      backgroundColor: AppColors.content,
      // Text color
      foregroundColor: Colors.green,
      // Icon color
      toolbarHeight: 80.0,
      iconTheme: IconThemeData(color: Colors.white, size: 24.0),
      actionsIconTheme: IconThemeData(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(36.0),
          bottomLeft: Radius.circular(36.0),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: AppFonts.dosis,
        fontSize: 28.0,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.4,
        //shadows: [
        //  Shadow(
        //    color: Colors.yellowAccent,
        //    blurRadius: 14,
        //    offset: Offset(2, 2),
        //  ),
        //],
      ),
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: AppFonts.dosis,
        fontSize: 28.0,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.4,
      ),
    ),

    /// Text
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      headline2: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      headline3: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      headline4: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      headline5: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      headline6: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      // Input text content color
      subtitle1: TextStyle(
        color: Colors.black,
        fontFamily: AppFonts.dosis,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      ),
      subtitle2: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      bodyText1: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      bodyText2: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      button: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      caption: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
      overline: TextStyle(color: Colors.black, fontFamily: AppFonts.dosis),
    ),

    /// TextSelectionTheme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.content,
      selectionColor: AppColors.background,
      // ???
      selectionHandleColor: Colors.green,
    ),

    /// ButtonTheme
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.purple,
      padding: EdgeInsets.all(200.0),
      textTheme: ButtonTextTheme.primary,
    ),

    /// TextButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.content,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          shadows: [
            Shadow(
              color: Colors.green,
              blurRadius: 20.0,
              offset: Offset(0.0, 2.5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        side: const BorderSide(width: 2.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    /// ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    /// FloatingActionButton
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.turquoise,
      foregroundColor: Colors.white,
      splashColor: Colors.white.withOpacity(0.2),
      elevation: 0.0,
      disabledElevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      shape: const CircleBorder(
          //borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
    ),

    /// Input: TextEditingController
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      iconColor: Colors.black,
      suffixIconColor: Colors.black,
      prefixIconColor: Colors.red,
      //constraints: BoxConstraints.loose(const Size.fromHeight(100.0)),
      //constraints: const BoxConstraints.tightForFinite(),
      constraints: const BoxConstraints.tightFor(),
      //isDense: true,
      labelStyle: const TextStyle(
        // Floating input label color
        color: Colors.black,
        fontFamily: AppFonts.dosis,
        fontWeight: FontWeight.w800,
        fontSize: 20.0,
      ),
      errorStyle: const TextStyle(
        color: AppColors.chiliPepper,
        fontFamily: AppFonts.dosis,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
      ),
      // ???
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(width: 6.0),
      ),
      //border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(width: 4.0),
      ),
      // ???
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 4.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.chiliPepper,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.chiliPepper,
          width: 4.0,
        ),
      ),
    ),

    /// Page
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    /// Icon
    iconTheme: const IconThemeData(
      shadows: [
        Shadow(
          color: Colors.green,
          blurRadius: 20.0,
          offset: Offset(0.0, 2.5),
        ),
      ],
    ),

    /// Tooltip
    tooltipTheme: const TooltipThemeData(
      padding: EdgeInsets.all(16.0),
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: AppFonts.dosis,
        fontSize: 16.0,
        fontWeight: FontWeight.w800,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),

    /// Dialog
    dialogTheme: const DialogTheme(
      elevation: 0.0,
      // alert dialog
      backgroundColor: Colors.white,
      iconColor: Colors.black,
      // alignment: Alignment.topCenter,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: AppFonts.dosis,
        fontSize: 24.0,
        fontWeight: FontWeight.w800,
      ),
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: AppFonts.dosis,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      actionsPadding: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),

    /// SnackBar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.content,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: AppFonts.dosis,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.0,
      ),
      actionTextColor: Colors.white,
      disabledActionTextColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
    ),

    /// CheckBox
    checkboxTheme: CheckboxThemeData(
      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: MaterialStateProperty.resolveWith((_) => AppColors.content),
      side: const BorderSide(width: 3.0),
      checkColor: MaterialStateProperty.resolveWith((_) => Colors.white),
      overlayColor: MaterialStateProperty.resolveWith((_) => Colors.white),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      mouseCursor: MaterialStateProperty.all<MouseCursor?>(
        SystemMouseCursors.click,
      ),
    ),

    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 28.0,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      headline3: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      headline4: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 10.0,
        fontWeight: FontWeight.w800,
      ),
      headline5: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      headline6: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      subtitle1: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            color: Colors.green,
            blurRadius: 10.0,
            offset: Offset(0.0, 2.5),
          ),
        ],
      ),
      subtitle2: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      bodyText1: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            color: Colors.green,
            blurRadius: 10.0,
            offset: Offset(0.0, 2.5),
          ),
        ],
      ),
      bodyText2: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      button: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      caption: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      overline: TextStyle(color: Colors.white, fontFamily: 'Lato'),
      //labelLarge: const TextStyle(
      //  color: Colors.white,
      //  fontFamily: 'Lato',
      //  fontSize: 28.0,
      //  fontWeight: FontWeight.w800,
      //),
    ),
  );
}
