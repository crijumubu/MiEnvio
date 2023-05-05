import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shippings_driver/shippings_driver.dart';

class Flete extends StatelessWidget {
  const Flete({super.key, required this.envio});
  final Shipping envio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      backgroundColor: Colors.grey[100],          
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Flete", style: GoogleFonts.rubik(fontSize: 34, fontWeight: FontWeight.bold),),
          ),
        Divider(color: Colors.grey, thickness: 0.8,),

          const SizedBox(height: 5,),
          DataField(
            title: 'Resumen de costos operativos', 
            sections: [
              DataSection(
                dataRows: [
                  DataRow(title: 'Tonelada x KM movilización:', content: '\$328.53', ),
                  DataRow(title: 'Costo tonelada movilización:', content: '\$131,345.54', ),
                  DataRow(title: 'Costo movilización carga:', content: '\$1,182,109.83', ),
                ],
              ),              
              DataSection(
                dataRows: [
                  DataRow(title: 'Costo hora adicional:', content: '\$21.171', ),
                  DataRow(title: 'Horas de espera:', content: '10.0', ),
                  DataRow(title: 'Costo tiempos de espera:', content: '\$271,707.90', ),
                ],
              ),
              DataSection(
                dataRows: [
                  DataRow(title: 'Tonelada x KM del viaje:', content: '\$404.04', ),
                  DataRow(title: 'Costo tonelada del viaje:', content: '\$161,535.30', ),
                  DataRow(title: 'Costo total del viaje:', content: '\$1,453,817.73', ),
                ],
              ),
              DataSection(
                dataRows: [
                  DataRow(title: 'Costo x KM movilización:', content: '\$2,956.75', ),
                  DataRow(title: 'Costo x KM del viaje:', content: '\$3,636.36', ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    backgroundColor: Color(0xff3344E41),
                    shadowColor:Color.fromRGBO(224, 224, 224, 1)
                  ),
                  onPressed:(){
              
                  }, 
                  child: Text("Descargar costos en detalle", style: GoogleFonts.rubik(fontSize: 20), textAlign: TextAlign.center,) 
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
        ],
      )
    );
  }
}

class DataField extends StatelessWidget {
  const DataField({
    super.key, required this.title, required this.sections,
  });

  final String title;
  final List<Widget> sections; 

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (var i = 0; i < sections.length; i++) {
      children.add(sections[i]);
      if(i != sections.length-1){
        children.add(const SizedBox(height: 15,));
      }
    }

    return Column(
      
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title, style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),),
          ),
        ),
        const SizedBox(height: 10,),
        // Divider(color: Colors.grey, thickness: 0.8,),
        ...children
      ],
    );
  }
}

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

class DataRow extends StatelessWidget {
  const DataRow({
    super.key, required this.title, required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(title, style: GoogleFonts.rubik(fontSize: 18),)
        ),
        const SizedBox(height: 5,),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 249, 233),
            border: Border.all(color: Color(0xff7b7b7b)),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: SizedBox(
              width: double.infinity,  
              child: Text(content, style: GoogleFonts.rubik(fontSize: 18),)
            ),
          ),
        )
      ],
    );
  }
}
