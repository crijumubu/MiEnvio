import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.text, required this.imgRoute, required this.btnRoute});
  final String text;
  final String imgRoute;
  final String btnRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(20)), 
      //   color: Color(0xffd9d9d9),
      // ),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, btnRoute);
        },
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)), 
                color: Color(0xffDAD7CD),
              ),
              padding: const EdgeInsets.all(35),
              child: Image.asset("assets/images/$imgRoute", scale: 8,)
            ),
            const SizedBox(height: 15,),
            Text(text, style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w600),),
            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}