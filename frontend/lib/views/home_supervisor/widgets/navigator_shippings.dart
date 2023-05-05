import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shippings_driver/shippings_driver.dart';
import '../../shippings_driver/widgets/map.dart';

class NavigatorShippings extends StatelessWidget {
  NavigatorShippings({super.key, required this.id, required this.enviosList, required this.filtersActive, required this.addFilter, required this.removeFilter, required this.btnText, required this.btnRegister});
  final int id;
  // final AuthController _authController = AuthController();
  final List<Shipping?> enviosList;
  final List<int> filtersActive;
  final Function(int) addFilter;
  final Function(int) removeFilter;
  final String btnText;
  final bool btnRegister;
  // final VoidCallback filter;

  @override
  Widget build(BuildContext context) {
    List<Widget> children;


    if(enviosList.isEmpty){
      children = [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(child: Text("No hay envios registrados.", style: GoogleFonts.rubik(fontSize: 18),)),
        )
      ];
    }else{
      List<Widget> enviosCard = [];
      for(var i in enviosList){
        if(i != null){
          if(i.estado==3 && !btnRegister) continue;

          enviosCard.add(Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ShippingItem(shipping: i, btnText:btnText, updateStatus: !btnRegister, idUser: id,),
          ));
          if(enviosList.last != i) enviosCard.add(SizedBox(height: 10,));
        }        
      }
      // if(enviosCard =)

      children = enviosCard;
    }


    return Column(
      children: [
        Visibility(
          visible: btnRegister,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  // side: BorderSide(color: Colors.white),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: Color(0xff3344E41),
                  shadowColor:Color.fromRGBO(224, 224, 224, 1)
                  
        
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "/register-shipping", arguments: id);
                }, 
                child: Text("Registrar Envio", style: GoogleFonts.rubik(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500 ),)
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Text("Envios Registrados", style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w700),),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              ShippingStatus(color: Colors.yellow, active: filtersActive.contains(1), title: "Pendiente", estado: 1, add: addFilter,  remove: removeFilter,),
              const SizedBox(width: 5,),
              ShippingStatus(color: Colors.green, active: filtersActive.contains(2), title: "Activo", estado: 2, add: addFilter,  remove: removeFilter,),
              const SizedBox(width: 5,),
              ShippingStatus(color: Colors.red, active: filtersActive.contains(3), title: "Finalizado",  estado: 3, add: addFilter,  remove: removeFilter,),
            ],
          ),
        ),
        Divider(),
        if(children.isEmpty)
          Container(
            decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(child: Text("No hay envios en este estado", style: GoogleFonts.rubik(fontSize: 18),)),
          )
        else
          Column(children: children),
      ],
    );
  }
}


class ShippingStatus extends StatelessWidget {
  const ShippingStatus({super.key, required this.color, required this.active, required this.title, required this.add, required this.remove, required this.estado});
  final Color color;
  final bool active;
  final String title;
  final int estado;
  final Function(int) add;
  final Function(int) remove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(active){
          remove(estado);
        }else{
          add(estado);
        }
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: active ? Colors.white : Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(color: Color.fromRGBO(224, 224, 224, 1), blurRadius: 3)]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical:3 ),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active ? color : Colors.grey,
                ),
                child: Text("•", style: TextStyle(color: active ? color : Colors.grey,),),
              ),
              SizedBox(width: 5,),
              Text(title,style: GoogleFonts.rubik(color: active ? color : Colors.grey,)),
            ],
          ),
    
        ),
      ),
    );
  }
}

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key, required this.shipping, required this.btnText, required this.updateStatus, required this.idUser});
  final Shipping shipping;
  final String btnText;
  final int idUser;
  final bool updateStatus;

  @override
  Widget build(BuildContext context) {
    Color colorEstado;
    if(shipping.estado == 1){
      colorEstado = Colors.yellow;
    }else if(shipping.estado == 2){
      colorEstado = Colors.green;
    }else{
      colorEstado = Colors.red;
    }

    return GestureDetector(
      onTap: (){
        if(updateStatus){
          Navigator.pushNamed(context, "/scan-qr", arguments: [shipping.idViaje, idUser, shipping.estado]);
        }else{
          Navigator.pushNamed(context, "/flete", arguments: shipping);
        }
      },
      child: Container(
        decoration:  BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [BoxShadow(color: Color.fromRGBO(224, 224, 224, 1), blurRadius: 3)]
    
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${shipping.nombre} ", 
                      textAlign: TextAlign.left,
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 20, color: colorEstado),
                    ),
                    // if(shipping.estado == 1)
                    //   Text("Pendiente", style: GoogleFonts.rubik(color:Colors.yellow, fontSize: 18))
                  ],
                ),
                SizedBox(height:3,),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Origen: ", style: GoogleFonts.rubik(color: Colors.grey)),
                        TextSpan(text: shipping.origen, style: GoogleFonts.rubik(color: Colors.black))
                      ],
                      style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400),
                    ),                    
                    textAlign: TextAlign.left,
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Destino: ", style: GoogleFonts.rubik(color: Colors.grey)),
                        TextSpan(text: shipping.destino, style: GoogleFonts.rubik(color: Colors.black))
                      ],
                      style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400),
                    ),                    
                    textAlign: TextAlign.left,
                  )
                ),
              ],
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Text("${btnText}", style: GoogleFonts.rubik(color:Color.fromARGB(255, 177, 184, 166)),),
                const SizedBox(width: 5,),
                const Icon(Icons.local_shipping, color: Color.fromARGB(255, 177, 184, 166),),
              ],
            )
          ],
        ),
      ),
    );
  }
}