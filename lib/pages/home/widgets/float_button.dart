import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FBWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.blueAccent,
      splashColor: Colors.lightBlue,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: (){
      Get.toNamed('/dataClient');
      },
    );
  }
}