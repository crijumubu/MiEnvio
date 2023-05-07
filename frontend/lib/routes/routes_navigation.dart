import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/view/pages/favorites.dart';
import 'package:frontend/view/widgets/navigation.dart';

import '../model/product.dart';
import '../view/pages/products_view.dart';
import '../view/pages/user.dart';


List<Product> listaProductos = [
  Product(img: "/img", nombre: "Producto1", vendedor: "Vendedor1", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto2", vendedor: "Vendedor2", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto3", vendedor: "Vendedor3", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto4", vendedor: "Vendedor4", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto5", vendedor: "Vendedor5", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto6", vendedor: "Vendedor6", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto7", vendedor: "Vendedor7", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto8", vendedor: "Vendedor7", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto9", vendedor: "Vendedor7", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto10", vendedor: "Vendedor7", calificacion: "5.0", favorito: 0),
  Product(img: "/img", nombre: "Producto11", vendedor: "Vendedor7", calificacion: "5.0", favorito: 0),
];

class RoutesNavigation extends StatelessWidget {
  final int index;
  
  const RoutesNavigation({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages =  [
      const User(),
      Products(lista: listaProductos),
      const Favorites(),
    ];

    return pages[index];
  }
}
