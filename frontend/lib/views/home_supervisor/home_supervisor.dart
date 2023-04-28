import 'package:flutter/material.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_settings.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_shippings.dart';
import 'widgets/navigation.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key, required this.user});
  final Usuario user;

  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
  int index = 0;
  Navigation ?navigation;
  late double height = 0;
  final ScrollController _scrollController = ScrollController();
  bool scrolled = true;
  // double? _scrolledUnderElevation;

  @override
  void initState() {

    _scrollController.addListener(listenScroll);
    navigation = Navigation(
      currentIndex: (i){
        // print(_scrollController.position.pixels);
        if(!(_scrollController.position.pixels <= 0)){
          _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

          Future.delayed(Duration(milliseconds: 500), (){
              setState(() {
                index = i;
              });
            }
          );
        }else{
          setState(() {
              index = i;
          });
        }
      }
    );
    super.initState();
    
  }

  void listenScroll() {
    final bool isTop = _scrollController.position.pixels <= 0;
    // print(_scrollController.position.pixels);
    setState(() {
      scrolled = isTop;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(height == 0) height = MediaQuery.of(context).size.height;
    // print(index);    

    return Scaffold(
      bottomNavigationBar: navigation,
      extendBody: true,
      backgroundColor: Colors.grey[100],      
      appBar: AppBar(
        backgroundColor: (scrolled ? Colors.white : Colors.black),
        leading: SizedBox(width: 0, height: 0,),
        
        flexibleSpace: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: (scrolled ? Colors.white : Color(0xff3344E41))
            
          ),
          // foregroundDecoration: BoxDecoration(
          //   color: Colors.red
          // ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Align(
                    alignment:  Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/logobl.png",
                      scale: 2.3,
                      color: (scrolled ? Color.fromARGB(190, 0, 0, 0) : Colors.white),
                    ),
                  ),
            
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/logout.png", scale: 18, color: (scrolled ? Color.fromARGB(190, 0, 0, 0) : Colors.white),),
                      ),
                    ),
                  )
                        
                ],
              ),
            ),
          ),
        ),
        // title: 
        // scrolledUnderElevation: _scrolledUnderElevation,
        shadowColor: Colors.transparent,
      ),    
      body: SafeArea(
        bottom: false,
        child: ListView(
          controller: _scrollController,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header(),
            if(index == 0)
              NavigatorHome(height: height, name: widget.user.name,)
            else if(index == 1)
              NavigatorShippings()
            else if(index == 2)
              NavigatorSettings(user: widget.user,)
          ],
        ),
      )
    );
  }
}