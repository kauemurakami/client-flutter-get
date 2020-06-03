import 'package:client_deno/pages/client/client.dart';
import 'package:client_deno/pages/home/home.dart';
import 'package:get/get.dart';

class MyRoutes {

static final routes = {
  '/': GetRoute(page: HomePage()),
  '/dataClient': GetRoute(page: DataClientPage())
};

}

