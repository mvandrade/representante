import 'package:flutter/material.dart';
import 'package:recorrente/core/constants/color_constants.dart';
import 'package:recorrente/widgets/header.dart';
import 'package:recorrente/widgets/title_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding / 8),
          child: Column(
            children: const [
              Header(),
              TitlePage(title: 'Home Page',)
            ],
          ),
        ),
      ),
    );
  }
}
