import 'package:flutter/material.dart';
import 'package:smartclass/responsive_login/desktop/desktop_login_page.dart';
import 'package:smartclass/responsive_login/mobile/mobile_signup_page.dart';
import 'package:smartclass/responsive_login/responsive_layout.dart';
import 'package:smartclass/responsive_login/tablet/tablet_login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF24112f),
        hoverColor: const Color(0xFF24112f),
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: MobileSignUpPage(),
        tabletScaffold: TabletLoginPage(),
        desktopScaffold: DesktopLoginPage(),
      ),
    );
  }
}
