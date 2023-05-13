import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/routes/route_generator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setInitialRoute().then((value) {
    runApp(MyApp(route: value,));

  });
}

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({super.key, required this.route});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff344E41),
        ),
        textTheme: GoogleFonts.rubikTextTheme()
      ),
      initialRoute: route,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

Future setInitialRoute()async{
  SharedPreferences shPref = await SharedPreferences.getInstance();

  bool alreadyAcepted =  (shPref.getBool("policy") ?? false);
  if(alreadyAcepted){
    // shPref.remove("policy");
    return "initial-page";
  }
  return "introduction";
}