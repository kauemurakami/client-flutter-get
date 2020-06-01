import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart' as MyRoutes;
import 'pages/home/home.dart';
void main() {
  runApp(
    GetMaterialApp(
      namedRoutes: MyRoutes.routes,
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

