import 'package:flutter/material.dart';
import 'package:frontend/views/home_supervisor/widgets/header.dart';

import 'widgets/navigation.dart';

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
      // appBar: AppBar(
      //   title:  Image(
      //     image: const AssetImage("assets/images/logo200.png"),
      //     color: Colors.white.withOpacity(0.5),
      //     colorBlendMode: BlendMode.modulate,
      //     height: 100
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.white,
      //   leading: null,
      // ),
      
      body: Container(
      padding: const EdgeInsets.all(1),
      child: ListView(
        children: const [
          Header(),
        ],
      ),
      ));
  }
}