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
        styleTitle: GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w700),
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui. Cras semper ligula lacinia, semper velit vel, ultricies mauris. Nulla et sem nisl. Mauris consequat nulla eget leo volutpat, sit amet ullamcorper quam interdum. Nunc blandit lacus diam, ac accumsan leo tempus in.",
        styleDescription: GoogleFonts.rubik(fontSize: 16, textBaseline: TextBaseline.alphabetic),
        pathImage: "assets/images/logo200.png",
        heightImage: 250,
        // heightImage: 300,
        backgroundColor: Colors.grey[100]
      )
    );

    slides.add(
      ContentConfig(
        title: "¿Qué es MiEnvio?",
        styleTitle: GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w700),
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium ex lectus, ac tincidunt urna semper volutpat. Nam laoreet, mi volutpat tincidunt fermentum, lacus est tincidunt elit, ac volutpat quam ipsum vel dui. Cras semper ligula lacinia, semper velit vel, ultricies mauris. Nulla et sem nisl. Mauris consequat nulla eget leo volutpat, sit amet ullamcorper quam interdum. Nunc blandit lacus diam, ac accumsan leo tempus in. Vestibulum luctus ligula urna, sit amet consectetur lacus rutrum non. Integer id turpis quis augue tincidunt imperdiet. ",
        styleDescription: GoogleFonts.rubik(fontSize: 16),
        pathImage: "assets/images/map.png",
        backgroundColor: Colors.grey[100]
      )
    );

        

  }

  void onDonePress(){
    print("End of slider");
  }

  @override
  Widget build(BuildContext context) {

    slides.add(
      ContentConfig(
        title: "Soy un",
        styleTitle: GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w700),
        centerWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(vertical: 30,     horizontal: 30), backgroundColor: const Color(0xffDAD7CD)),
                    child: Image.asset("assets/images/manager.png", width: 120,)
                  ),
                  const SizedBox(height: 10,), 
                  Text('Supervisor', style: GoogleFonts.rubik(fontSize: 30, color: const Color.fromARGB(206, 0, 0, 0), fontWeight: FontWeight.w500),)
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(vertical: 30,     horizontal: 30), backgroundColor: const Color(0xffDAD7CD)),
                    child: Image.asset("assets/images/driver.png", width: 120,)
                  ),
                  const SizedBox(height: 10,), 
                  Text('Conductor', style: GoogleFonts.rubik(fontSize: 30, color: const Color.fromARGB(206, 0, 0, 0), fontWeight: FontWeight.w500),)
                ],
              ),
            ],
          )
        ),
        styleDescription: GoogleFonts.rubik(fontSize: 16),
        backgroundColor: Colors.grey[100]
      )
    );
    
    return Scaffold(
      body: IntroSlider(
        key: UniqueKey(),
        listContentConfig: slides,
        onDonePress: onDonePress,
      ),
    );
  }
}