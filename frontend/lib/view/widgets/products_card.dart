import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/product.dart';
import '../pages/initial_page.dart';

class ProductsCard extends StatefulWidget {
  final List<Product> products;

  const ProductsCard({super.key, required this.products});

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  List<Widget> cards = [];

  @override
  void initState() {
    // int nextRow = 0;
    List<Product> list = widget.products;
    Widget ?previousCard;

    for (var product in list) {
      if(previousCard == null){
        previousCard = productCard(nombre: product.nombre, vendedor: product.vendedor, calificacion: product.calificacion);
        
        if(list.lastIndexOf(product) == list.length-1){
          cards.add(Row( 
            children: [previousCard, productCard()]
            )
          );
          continue;
        }
        continue;
      }
      
      cards.add(Row( children: [previousCard,const Spacer(), productCard(nombre: product.nombre, vendedor: product.vendedor, calificacion: product.calificacion)]));
      previousCard = null;
      
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: 
      cards,
    );
  }
}

SizedBox productCard({String nombre = '', String vendedor="", String calificacion="", int favorito=0}){

  if(nombre != ''){
    return SizedBox(
      width:  anchoApp*0.47,
      // widthFactor: 0.4,
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(

          children: [
            // Image.network("src"),
            Text(nombre),
            Text(vendedor),
            Text(calificacion),
            // Text(nombre),
          ],
        ),
      ),
    );
  }

  return const SizedBox();
}
