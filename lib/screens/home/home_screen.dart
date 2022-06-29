import 'package:flutter/material.dart';
import 'package:recorrente/screens/home/pages/home_page.dart';
import 'package:recorrente/widgets/side_menu.dart';
import 'package:recorrente/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuWidget(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenuWidget(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
