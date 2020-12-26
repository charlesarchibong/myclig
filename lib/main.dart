import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/routes/route_generator.dart';
import 'package:myclig/features/user/presentation/bloc/user_bloc.dart';

import 'core/constants/colors_constant.dart';
import 'core/dependencies/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then(
        (value) => Logger().i(
          "connected " + value.options.asMap.toString(),
        ),
      )
      .catchError(
        (e) => Logger().i(e.toString()),
      );
  await di.initDi();
  await DotEnv().load('.env');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (BuildContext context) => sl<UserBloc>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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
      initialRoute: SPLASHSCREEN,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
