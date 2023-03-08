import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductToggle extends StatefulWidget {
  final Function currentIndex;
  
  const ProductToggle({super.key, required this.currentIndex});
  

  @override
  State<ProductToggle> createState() => _ProductToggleState();
}

class _ProductToggleState extends State<ProductToggle> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(        
      children: [
        IconButton(
          onPressed: (){
            setState(() {
              _index = 0;
              widget.currentIndex(_index);
            });

          }, 
          icon: const Icon(Icons.grid_view_rounded),
          iconSize: 30,
          color: _index == 0 ? const Color(0xff3A5A40) : const Color(0x733A5A40),
        ),
        IconButton(
          onPressed: (){
            setState(() {
              _index = 1;
              widget.currentIndex(_index);
            });

          }, 
          icon: const Icon(Icons.view_list_rounded,),
          color:  _index == 1 ? const Color(0xff3A5A40) : const Color(0x733A5A40),
          iconSize: 35,
        ),
      ],
    );
  }
}