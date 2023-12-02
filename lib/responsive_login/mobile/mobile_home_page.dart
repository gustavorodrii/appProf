import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_controller.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

// final controller = Get.put(UserController());

class _MobileHomePageState extends State<MobileHomePage> {
  // String? emailUser = controller.userModel!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Seu e-mail é $emailUser'),
          ),
    );
  }
}
