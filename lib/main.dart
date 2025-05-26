import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks/Models/service.dart';
import 'package:s_rocks/View%20Model/Home/homeVM.dart';
import 'package:s_rocks/View%20Model/Home/servicesVM.dart';
import 'package:s_rocks/View/Home/home.dart';
import 'package:s_rocks/View/servicePage/servicePage.dart';
import 'package:s_rocks/firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Servicesvm(),),
        ChangeNotifierProvider(create: (context)=> Homevm(),),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/servicePage': (context) =>  Servicepage(
            service: ModalRoute.of(context)!.settings.arguments as serviceModel
          ),
        },
        ));
  }
}
