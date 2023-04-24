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
      unselectedItemColor: Color(0xffA3B18A),
      selectedItemColor: Color(0xff3A5A40 ),
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.local_shipping),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.settings),
        ),
      ]
    );
  }
}

