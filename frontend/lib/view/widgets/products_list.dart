import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/product.dart';
import '../pages/initial_page.dart';

class ProductsList extends StatefulWidget {

  final List<Product> products;

  const ProductsList({super.key, required this.products});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<Widget> items = [];

    @override
  void initState() {
    List<Product> list = widget.products;

    for (var product in list) {
      items.add(productItem(nombre: product.nombre, vendedor: product.vendedor, calificacion: product.calificacion));    
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: 
      items,
    );
  }
}


SizedBox productItem({String nombre = '', String vendedor="", String calificacion="", int favorito=0}){

  return SizedBox(  
    width: anchoApp * 0.9,
    child: Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            children: [
              Image.network("src"),
            ],
          ),
          Column(
            children: [
              Text(nombre),
              Text(calificacion),
              Text(vendedor),
              Text(nombre),
            ],  
          )
        ],
      ),
    ),
  );

}
