import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/view/pages/favorites.dart';
import 'package:frontend/view/widgets/navigation.dart';

import '../view/pages/products.dart';
import '../view/pages/user.dart';

class RoutesNavigation extends StatelessWidget {
  final int index;
  
  RoutesNavigation({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      User(),
      Products(),
      Favorites(),
    ];

    return pages[index];
  }
}