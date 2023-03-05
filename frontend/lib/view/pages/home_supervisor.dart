import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/routes/routes_navigation.dart';

import '../widgets/navigation.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key});

  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
  int index = 0;
  Navigation ?navigation;

  @override
  void initState() {

    navigation = Navigation(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigation,
      
      body: Container(
        padding: const EdgeInsets.all(1),
        child: ListView(
          children: [
            RoutesNavigation(index: index)
          ],
        ),
      ),
    );
  }
}