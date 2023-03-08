import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/view/widgets/logo.dart';
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

        

  }

  void onDonePress(){
    print("End of slider");
  }
  
  ButtonStyle navStyleButton(){
    return const ButtonStyle(
      shape: MaterialStatePropertyAll(StadiumBorder()),
      backgroundColor: MaterialStatePropertyAll(Color(0xffA3B18A)),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 3))
    );
  }

  ElevatedButton userButton(img){
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        backgroundColor: const Color(0xffDAD7CD)
      ),
      child: Image.asset("assets/images/$img.png", width: 110,)
    );
  }
  

  @override
  Widget build(BuildContext context) {

    slides.add(
      ContentConfig(
        title: "Tipos de usuarios",
        styleTitle: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700, color: const Color(0xff344E41)),
        centerWidget: Container(
          padding: const EdgeInsets.only(left: 20, right:20, top: 50),
          child: 
          Row(
            mainAxisSize: MainAxisSize.max
            ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  userButton("manager"),
                  const SizedBox(height: 10,), 
                  Text('Supervisor', style: GoogleFonts.rubik(fontSize: 28, color: const Color.fromARGB(206, 0, 0, 0), fontWeight: FontWeight.w500),)
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  userButton("driver"),
                  const SizedBox(height: 10,), 
                  Text('Conductor', style: GoogleFonts.rubik(fontSize: 28, color: const Color.fromARGB(206, 0, 0, 0), fontWeight: FontWeight.w500),)
                ],
              ),
            ],
          )
        ),
        // styleDescription: 
        backgroundColor: Colors.grey[100],
        // description:,
        widgetDescription: Container(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text( "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui.", style: GoogleFonts.rubik(fontSize: 16), textAlign: TextAlign.justify,))
        
      )
    );
    
    return Scaffold(
      body: IntroSlider(
        key: UniqueKey(),
        backgroundColorAllTabs: Color(0xffDAD7CD),
        listContentConfig: slides,
        onDonePress: onDonePress,
        isShowDoneBtn: false,
        isShowSkipBtn: false,
        renderNextBtn: const Icon(Icons.navigate_next_rounded, size: 35, color: Color(0xff344E41),),
        renderPrevBtn: const Icon(Icons.navigate_before_rounded, size: 35, color: Color(0xff344E41),),
        prevButtonStyle: navStyleButton(),
        nextButtonStyle: navStyleButton()
      ),
    );
  }
}