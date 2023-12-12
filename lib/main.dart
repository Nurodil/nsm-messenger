import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nsm_messenger/features/landing/screens/landing_screen.dart';
import 'package:nsm_messenger/router.dart';
import 'package:nsm_messenger/widgets/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NMSChat',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: const AppBarTheme(
          color: tabColor
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings) ,
      home: LandingScreen(),
    );
  }
}