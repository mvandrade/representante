import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recorrente/extensions/stringExtension.dart';
import 'package:recorrente/screens/home_screen.dart';
import 'package:recorrente/screens/login_screen.dart';
import 'package:recorrente/screens/reset_password_screen.dart';
import 'package:recorrente/screens/reset_password_success_screen.dart';
import 'package:recorrente/screens/confirm_password_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/color_constants.dart';
import 'core/init/provider_list.dart';
import 'firebase_options.dart';
import 'package:recorrente/utils/app_routes.dart';
import 'package:recorrente/utils/data_routing.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // String mode;
    // String oobCode;
    // String apiKey;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.LOGIN: (ctx) => const LoginScreen(),
        AppRoutes.HOME: (ctx) => const HomeScreen(),
        AppRoutes.FORGOT: (ctx) => const ForgotScreen(),
        AppRoutes.FORGOT_SUCCESS: (ctx) => const ForgotSuccessScreen(),
        // AppRoutes.CONFIRM_PASSWORD: (ctx) => const ConfirmPasswordScreen(),
      },
      onGenerateRoute: (settings) {
        var dataRouting = settings.name!.getDataRouting;

        switch (dataRouting.route) {
          case '/ConfirmPasswordScreen' :
            return MaterialPageRoute(
              builder: (context) => ConfirmPasswordScreen(
                  oobCode: dataRouting['oobCode'],
                ),
            );
          default:
           return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
           );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
