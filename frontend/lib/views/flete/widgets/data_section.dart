import 'package:flutter/material.dart';

class DataSection extends StatelessWidget {
  const DataSection({
    super.key, required this.dataRows,
  });

  final List<Widget> dataRows;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < dataRows.length; i++) {
      children.add(dataRows[i]);
      if(i != dataRows.length-1){
        children.add(const SizedBox(height: 10,),);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7))
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top:10, bottom: 20),
          child: Column(children: children,),
        ),
      ),
    );
  }
}