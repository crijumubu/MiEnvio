import 'package:flutter/material.dart';
import 'package:frontend/views/introduction/widgets/alerts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding.dart';


class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int index = 0;
  late PageController _pageController;



  final pagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff344E41),
        ),
        child: 
        Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    ),
                    child: Image.asset(
                      'assets/images/logo200.png',
                      color: Colors.white,
                      scale: 0.7,
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only( 
                    topLeft: Radius.circular(40), 
                    // topRight: Radius.circular(20)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 45, right: 45),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Bienvenido !",
                          style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        '¡Bienvenido a nuestra aplicación móvil de cálculo de fletes y control de envíos! Esta aplicación está diseñada para ayudarte a calcular el costo de los fletes y mantener un seguimiento detallado de tus envíos.',
                        style: GoogleFonts.rubik(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )
              ),
            ),    
          ],
        ),
      ),
    ),

    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff344E41),
          
        ),
        child: 
        Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    ),
                    child: Image.asset(
                      'assets/images/map2.png',
                      color: Colors.white,
                      scale: 2.4,
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 45, right: 45),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "¿Para qué sirve MiEnvío?",
                          style: GoogleFonts.rubik(fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        '¡Nuestra aplicación está diseñada para ayudarte a calcular el costo de los fletes y mantener un seguimiento detallado de tus envíos. Con nuestra interfaz intuitiva y fácil de usar, podrás tener acceso a la información de tus envíos en tiempo real.',
                        style: GoogleFonts.rubik(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )
              ),
            ),    
          ],
        ),
      ),
    ),

    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff344E41),
        ),
        child: 
        Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                    ),
                    child: Image.asset(
                      'assets/images/driver.png',
                      color: Colors.white,
                      scale: 2.4,
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only( 
                    topRight: Radius.circular(40)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 45, right: 45),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Acerca de MiEnvio",
                          style: GoogleFonts.rubik(fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        'MiEnvío cuenta con dos tipos de usuarios.',
                        style: GoogleFonts.rubik(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.rubik(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(text: "Conductor:", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w600)),
                            TextSpan(text: " Nuestra aplicación te ayudará a realizar entregas de manera más eficiente y organizada.", )
                          ]
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.rubik(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(text: "Supervisor:", style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w600)),
                            TextSpan(text: " Nuestra aplicación te permitirá supervisar y administrar el trabajo de tus conductores", )
                          ]
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                    ],
                  ),
                )
              ),
            ),    
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onDonePress(){
    modalWindow(context,);
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

    Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          index++;
          setIndex!(index);
          // _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Siguiente',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: Color(0xff344E41),
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          onDonePress();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Continuar',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Onboarding(
        pages: pagesList,
        onPageChange: (int pageIndex){
          index = pageIndex;
        },
        startPageIndex: 0,
        
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              // border: Border.all(
              //   width: 0.0,
              //   color: background,
              // ),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.polygon(
                          polygonDesign: PolygonDesign(
                            polygon: DesignType.polygon_circle,
                          ),
                        ),
                        activeIndicator: ActiveIndicator(color: Colors.grey),
                        closedIndicator: ClosedIndicator(color: Color.fromARGB(255, 173, 173, 173))
                      )
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}