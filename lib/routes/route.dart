//function to set routes

import 'package:flutter/material.dart';
import 'package:movies_consumer/routes/app_route.dart';
import 'package:movies_consumer/screens/information.dart';
import 'package:movies_consumer/screens/menu.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, Widget Function(BuildContext)>{
    Routes.MAIN_MENU: (BuildContext build) => MenuPage(),
    Routes.INFORMATION: (BuildContext build) => const InformationPage(),
  };
}
