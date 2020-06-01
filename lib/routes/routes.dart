import 'package:client_deno/pages/client/client.dart';
import 'package:client_deno/pages/home/home.dart';
import 'package:get/get.dart';

final routes = {
  '/': GetRoute(page: HomePage()),
  '/addClient': GetRoute(page: AddClientPage())
};
