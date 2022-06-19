import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: const [
          Center(
            child: Text('Screen Home', style: TextStyle(fontSize: 25),),
          ),
        ],
      ),
    );
  }
}