import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/pages/favorites.dart';
import 'package:frontend/widgets/navigation.dart';

import '../pages/products.dart';
import '../pages/user.dart';

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