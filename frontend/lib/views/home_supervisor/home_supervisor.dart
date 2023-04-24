import 'package:flutter/material.dart';
import 'package:frontend/views/home_supervisor/widgets/header.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_settings.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_shippings.dart';
import '../shippings_driver/shippings_driver.dart';
import '../shippings_driver/widgets/card_shipping.dart';
import 'widgets/navigation.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key});

  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
  int index = 0;
  Navigation ?navigation;
  late double height = 0;

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
    if(height == 0) height = MediaQuery.of(context).size.height;
    print(index);    

    return Scaffold(
      bottomNavigationBar: navigation,
      
      body: Center(
      // padding: const EdgeInsets.all(1),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(),
          if(index == 0)
            NavigatorHome()
          else if(index == 1)
            NavigatorShippings()
          else if(index == 2)
            NavigatorSettings()
        ],
      ),
      )
    );
  }
}