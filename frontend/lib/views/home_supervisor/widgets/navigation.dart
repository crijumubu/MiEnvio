import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final Function currentIndex;
  const Navigation({super.key, required this.currentIndex});

  @override
  State<Navigation> createState() => _NavigationState();

}

class _NavigationState extends State<Navigation> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 216, 216, 216),
          spreadRadius: 2,
          blurRadius: 10


        )
      ],
      unselectedItemColor: Colors.grey[400],
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.person_outlined),
          // label: "Usuario"
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          // label: "Productos"
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.star_border),
          // label: "Favoritos"
        ),
      ]
    );
    // return BottomNavigationBar(
    //   // backgroundColor: const Color(0xff2F463B),
    //   unselectedItemColor: const Color(0x66344E41),
    //   selectedItemColor: const Color(0xff344E41),
    //   iconSize: 25.0,
    //   selectedFontSize: 14.0,
    //   unselectedFontSize: 12.0,

    //   currentIndex: index,
    //   onTap: (int i){
    //     setState(() {
    //       index = i;
    //       widget.currentIndex(i);
    //     });
    //   },
    //   type: BottomNavigationBarType.fixed,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person_outlined),
    //       label: "Usuario"
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.shopping_cart_outlined),
    //       label: "Productos"
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.star_border),
    //       label: "Favoritos"
    //     ),
        
    //   ]
    // );
  }
}

