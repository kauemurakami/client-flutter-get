import 'package:client_deno/pages/client/client.dart';
import 'package:client_deno/pages/client/client_panel.dart';
import 'package:client_deno/pages/home/home.dart';
import 'package:get/get.dart';

class MyRoutes {

static final routes = {
  '/': GetRoute(page: HomePage()),
  '/:newClient': GetRoute(page: HomePage()),
  //ever <NAME>PAGE never <NAME>WIDGET
  '/dataClient': GetRoute(page: DataClientPage()),
  '/panelClient': GetRoute(page: PanelClientPage()),

};

}

