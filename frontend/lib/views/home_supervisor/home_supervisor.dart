import 'package:flutter/material.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_settings.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_shippings.dart';
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
  double? _scrolledUnderElevation;

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
      backgroundColor: Colors.grey[100],      
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(width: 0, height: 0,),
        
        flexibleSpace: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 18,),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment:  Alignment.center,
                      child: Image.asset(
                        "assets/images/logo200.png",
                        scale: 2,
                        color: Color.fromARGB(190, 0, 0, 0),
                      ),
                    ),
              
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/images/logout.png", scale: 17, color: Color.fromARGB(190, 0, 0, 0),),
                    )
                          
                  ],
                ),
              ),
            ),
          ),
        ),
        // title: 
        scrolledUnderElevation: _scrolledUnderElevation,
        shadowColor: Colors.transparent,
      ),    
      body: SafeArea(
        child: Center(
        // padding: const EdgeInsets.all(1),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header(),
            if(index == 0)
              NavigatorHome(height: height,)
            else if(index == 1)
              NavigatorShippings()
            else if(index == 2)
              NavigatorSettings()
          ],
        ),
        ),
      )
    );
  }
}