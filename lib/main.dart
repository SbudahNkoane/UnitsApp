import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unit_reflections/Routes/route.dart';

import 'View Models/unit_view_model.dart';

void main() {
  runApp(const UnitsApp());
}

class UnitsApp extends StatelessWidget {
  const UnitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UnitViewModel(),
      builder: (context, child) {
        return MaterialApp(
          initialRoute: RouteManager.homePage,
          onGenerateRoute: RouteManager.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Units Reflection',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 235, 233, 233),
            appBarTheme: AppBarTheme(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              titleTextStyle: GoogleFonts.ultra(),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(204, 214, 54, 222),
              toolbarHeight: 100,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
        );
      },
    );
  }
}
