import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/routes/route_generator.dart';

import 'core/constants/colors_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyClig',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstant.PRIMARY_COLOR,
        primarySwatch: MaterialColor(
          0xFF072D72,
          ColorConstant.COLOR_SCRATCH,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.ptSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: HOME_SCREEN,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
