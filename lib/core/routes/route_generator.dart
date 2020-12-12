import 'package:flutter/material.dart';
import 'package:myclig/core/constants/route_names.dart';

import '../../main.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(
            title: 'MyClig',
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Text('404'),
        );
    }
  }
}
