import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key, required this.press, required this.location});
  final String location;
  final Function(String) press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            press(location);
          },
          horizontalTitleGap: 0,
          leading: Icon(Icons.add_location_alt_sharp),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.rubik(fontSize: 14),
          ),
        ),
        Divider(
          height: 2,
          thickness: 2,    
          // color: Color,
        )
      ],
    );
  }
}