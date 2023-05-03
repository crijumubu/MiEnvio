import 'package:flutter/material.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_home.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_settings.dart';
import 'package:frontend/views/home_supervisor/widgets/navigator_shippings.dart';
import '../../controller/auth_controller.dart';
import '../shippings_driver/shippings_driver.dart';
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
  List<Shipping> enviosList = [];
  List<int> filterList = [1,2,3];
  late List<Shipping?> enviosShow = [];
  final AuthController _authController = AuthController();


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
    _authController.allShippings(widget.user.id).then(
      (value){
        List<Shipping> envios = (value as List<dynamic>).map((e) => Shipping(nombre: e["nombre"], idViaje: e["idViaje"], idUsuario: e["idUsuario"], idFlete: e["idFlete"], origen: e["origen"], destino: e["destino"], estado: e["estado"], idConductor: e["idConductor"])).toList();

        enviosList = envios;
        setState(() {
          enviosShow = enviosList.toList();
        });
      }
    );
    super.initState();
    
  }

  void listenScroll() {
    final bool isTop = _scrollController.position.pixels <= 0;
    setState(() {
      scrolled = isTop;
    });
  }

  List<Shipping?>? filter(List<int>? filtro){
    if(filtro == null){
      List<Shipping?> newList = enviosList.map((e){
        if(filterList.contains(e.estado)){
          return e;
        }
        return null;
      }).toList();
      setState(() {
        enviosShow = newList;
      });
      return null;
    }else{
      List<Shipping?> newList = enviosList.map((e){
        if(filtro.contains(e.estado)){
          return e;
        }
        return null;
      }).toList();
      return newList;
    }
  }

  void addFilter(int number){
    filterList.add(number);
    filter(null);
  }

  void deleteFilter(int number){
    filterList.remove(number);
    filter(null);
  }


  @override
  Widget build(BuildContext context) {
    if(height == 0) height = MediaQuery.of(context).size.height;
    // print(index);    

    return WillPopScope(
      onWillPop: () async => false ,
      child: Scaffold(
        bottomNavigationBar: navigation,
        extendBody: true,
        backgroundColor: Colors.grey[100],      
        appBar: AppBar(
          toolbarHeight: height*0.09,
          backgroundColor: (scrolled ? Colors.white : Colors.black),
          leading: SizedBox(width: 0, height: 0,),
          
          flexibleSpace: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: (scrolled ? Colors.white : Color(0xff3344E41))
              
            ),
    
            width: double.infinity,
            // height: 300,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    // SizedBox(height: 0),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/logobl.png",
                        scale: 2.3,
                        color: (scrolled ? Color.fromARGB(190, 0, 0, 0) : Colors.white),
                      ),
                    ),
              
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, "initial-page");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
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
                NavigatorHome(height: height, name: widget.user.name, id: widget.user.id, enviosShow: enviosShow,)
              else if(index == 1)
                NavigatorShippings(id: widget.user.id, enviosList: enviosShow, filtersActive: filterList, addFilter: addFilter, removeFilter: deleteFilter, btnText: 'Ver detalles', btnRegister: true,)
              else if(index == 2)
                NavigatorSettings(user: widget.user,)
            ],
          ),
        )
      ),
    );
  }
}