
import 'package:detection/modules/doctor%20items/booking/coming.dart';
import 'package:detection/modules/doctor%20items/booking/done.dart';
import 'package:detection/modules/doctor%20items/patientnatification/patientnatification.dart';
import 'package:detection/modules/register/logo/logo.dart';
import 'package:detection/modules/showdoctor_screen/editeschudule/edite.dart';
import 'package:detection/modules/showdoctor_screen/natification/natifaction.dart';
import 'package:detection/modules/showdoctor_screen/schdule/schdule.dart';
import 'package:detection/shared/style/darkmode/dark.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.getTheme(),
          home:coming(),
        );
      },
    );
  }
}



