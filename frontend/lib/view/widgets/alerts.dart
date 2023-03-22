import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

void succesfulAlert(context, text){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: "Completado!",
    text: text,
    autoCloseDuration: const Duration(seconds:2 ),
    confirmBtnColor: const Color(0xff588157)
  );
}


void errorAlert(context, time,  text){
  
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: "Error!",
    text: text,
    autoCloseDuration: Duration(seconds:time),
    confirmBtnColor: const Color(0xff588157),

    onConfirmBtnTap: (){},
  
    
  );
}


void modalWindow(context){
  bool isChecked = false;
  showModalBottomSheet<dynamic>(
    context: context, 
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (BuildContext context) {
      return  StatefulBuilder(builder: 
      (BuildContext context, StateSetter setState){
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo200.png"),
              opacity: 0.15,
              scale: 0.7            // colorFilter: ColorFilter.mode(Colors.green, BlendMode. colorDodge  )
            ),

          ),
          height: MediaQuery.of(context).size.height * 0.88,
          child: SingleChildScrollView(

            padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 40),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Politicas de privacidad: ", style: GoogleFonts.rubik(fontSize: 30, fontWeight:  FontWeight.w700), ),
                const SizedBox(height: 10,),
                Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper  eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere   tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla   quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend  nec. Fu sce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.\nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est.Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.\nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis  velit sapien, a ullamcorper elit gravida nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt.hb Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex. \nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec.
                ''', textAlign: TextAlign.justify, style: GoogleFonts.rubik(fontSize: 15),),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                  title: const Text("Acepto que mi informacion sera usada conforme las politicas de privacidad de MiEnvio", style: TextStyle(fontSize: 14, decoration: TextDecoration.underline, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),
                  leading: Checkbox(
                    checkColor: Colors.white,
                    
                    value: isChecked,
                    onChanged: (bool? value){
                      setState((){
                        isChecked = value!;
                      });
                    },
                  ),
                  onTap: () {
                    setState((){
                      isChecked = !isChecked;
                    });
                  },

                ),
                
                SizedBox(
                  width: 120,
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: (isChecked ? Colors.green[900]: Colors.grey[700]), backgroundColor:  (isChecked ? Colors.green[50]: Colors.grey[100])),
                    onPressed: (){
                      if(isChecked){
                        Navigator.pushNamed(context, "/initial_page");
                      }
                    }, 
                    child: Text("Aceptar", style: TextStyle(fontWeight: FontWeight.w700, fontSize:  (isChecked ? 16:13)),)
                  ),
                ),
              ],
            ),
          ),
       );
      }
    );
      
      
    }
  );
}