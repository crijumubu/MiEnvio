import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/view/widgets/product_toggle.dart';
import 'package:frontend/view/widgets/products_card.dart';
import 'package:frontend/view/widgets/products_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/product.dart';

class Products extends StatefulWidget {
  
  final List<Product> lista;

  const Products({super.key, required this.lista});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  late List<Widget> vistas; 
  int index = 0;
  
  @override
  void initState() {
    vistas = [ ProductsCard(products: widget.lista ,),  ProductsList(products: widget.lista)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ProductToggle(currentIndex: (i){
            setState(() {
              index = i;
            });
          }),

          vistas[index]
          
        ],
      ),
      );
  }
}

