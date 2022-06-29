import 'package:flutter/material.dart';
import 'package:recorrente/responsive.dart';
import 'package:recorrente/widgets/side_menu.dart';
import 'package:recorrente/screens/agent/pages/agent_page.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
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
              child: AgentPage(),
            ),
          ],
        ),
      ),
    );
  }
}
