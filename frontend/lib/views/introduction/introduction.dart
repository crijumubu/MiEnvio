import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:frontend/view/pages/introduction/widgets/logo.dart';
import 'package:frontend/views/introduction/widgets/alerts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';


class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      ContentConfig(
        title: "Bienvenido a ",
        styleTitle: GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w700, color: const Color(0xff344E41)),
        pathImage: "assets/images/logo200.png",
         widgetDescription: Container( padding: const EdgeInsets.symmetric(horizontal: 10), child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus  lacinia, semper velit vel, ultricies mauris. Nulla et sem nisl. Mauris consequat nulla eget leo voluest tincidunt elit, ac volutpat quam ipsum vel dui. Cras semper ligulatpat, sit amet ullamcorper quam interdum. Nunc blandit lacus diam, ac accumsan leo tempus in.", style: GoogleFonts.rubik(fontSize: 16), textAlign: TextAlign.justify,)),
        heightImage: 250,
        // heightImage: 300,
        backgroundColor: Colors.grey[100]
      )
    );

    slides.add(
      ContentConfig(
        title: "¿Qué es MiEnvio?",
        styleTitle: GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w700, color: const Color(0xff344E41)),
        widgetDescription: Container( padding: const EdgeInsets.symmetric(horizontal: 10), child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui. Cras semper ligula lacinia, semper velit vel, ultricies mauris. Nulla et sem nisl. Mauris consequat nulla eget leo volutpat, sit amet ullamcorper quam interdum. Nunc blandit lacus diam, ac accumsan leo tempus in. Vestibulum luctus ligula urna, sit amet consectetur lacus rutrum non. Integer id turpis quis augue tincidunt imperdiet.", style: GoogleFonts.rubik(fontSize: 16), textAlign: TextAlign.justify,)),
        pathImage: "assets/images/map.png",
        backgroundColor: Colors.grey[100]
      )
    );

    slides.add(
      ContentConfig(
        title: "Tipos de usuarios",
        styleTitle: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700, color: const Color(0xff344E41)),
        centerWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: 
          Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              typeUser("manager", "Supervisor", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi   volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui."),
              const SizedBox(height: 30,),
              typeUser("driver", "Conductor", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi   volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui."),              
            ],
          )
        ),
        backgroundColor: Colors.grey[100],
        marginDescription: const EdgeInsets.all(0)
        // widgetDescription: Container(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text( "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui.", style: GoogleFonts.rubik(fontSize: 16), textAlign: TextAlign.justify,))
        
      )
    );  

  }

  void onDonePress(){

    modalWindow(context,);
    // Navigator.pushNamed(context, "/initial_page");
  }
  
  ButtonStyle navStyleButton(){
    return const ButtonStyle(
      shape: MaterialStatePropertyAll(StadiumBorder()),
      backgroundColor: MaterialStatePropertyAll(Color(0xffA3B18A)),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 3))
    );
  }

  

  Container typeUser(img, userType, text){
    return Container( 
      decoration: const BoxDecoration(color: Color(0xffDAD7CD), borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child:Row(
      children: [
        Column(
          children: [
            Image.asset("assets/images/$img.png", width: 100,),
            // userButton("manager"),
            // const SizedBox(width: 10,), 
            Text(userType, style: GoogleFonts.rubik(fontSize: 28, color: const Color.fromARGB(206, 0, 0, 0), fontWeight: FontWeight.w500),)
          ],
        ),
        Expanded(
          child: Container( padding:const  EdgeInsets.only(left: 10), child: 
          Text(text,style:  GoogleFonts.rubik(fontSize: 15), textAlign:  TextAlign.justify, ),
        ))
      ],
    ));
  }
  

  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      body: IntroSlider(
        key: UniqueKey(),
        backgroundColorAllTabs: const Color(0xffDAD7CD),
        listContentConfig: slides,
        onDonePress: onDonePress,
        // isShowDoneBtn: false,
        isShowSkipBtn: false,
        renderNextBtn: const Icon(Icons.navigate_next_rounded, size: 35, color: Color(0xff344E41),),
        renderPrevBtn: const Icon(Icons.navigate_before_rounded, size: 35, color: Color(0xff344E41),),
        renderDoneBtn: const Icon(Icons.done_all_rounded, size: 35, color: Color(0xff344E41),),
        prevButtonStyle: navStyleButton(),
        nextButtonStyle: navStyleButton(),
        doneButtonStyle: navStyleButton(),
      ),
    );
  }
}