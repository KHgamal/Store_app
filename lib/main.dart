import 'package:creativa/pages/fav.dart';
import 'package:creativa/pages/login.dart';
import 'package:creativa/pages/profile.dart';
import 'package:creativa/pages/register.dart';
import 'package:creativa/pages/splash_screen.dart';
import 'package:creativa/providers/auth.dart';
import 'package:creativa/providers/cart_provider.dart';
import 'package:creativa/providers/product_provider.dart';
import 'package:creativa/providers/theme_provider.dart';
import 'package:creativa/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


   return MultiProvider( providers:
       [
         ChangeNotifierProvider(create:  (context) =>AuthProvider(),),
         ChangeNotifierProvider(create:  (context) =>DarkThemeProvider(),),
         ChangeNotifierProvider(create:  (context) => CatProvider(),),
         ChangeNotifierProvider(create:  (context) => ProductProvider(),),
       ],
     child: MaterialApp(
         theme: ThemeData(
         primarySwatch: Colors.blue,
         //Default theme for text field
         inputDecorationTheme:  InputDecorationTheme(
           filled: true,
           fillColor: Colors.black12,
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide( color: Colors.black26),
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide(color: Colors.black26),
           ),
           labelStyle: const TextStyle(color: Colors.black38),
         ),
       ),
          debugShowCheckedModeBanner: false,
          home:const CustomSplashScreen(),
          //Root(pages: _pages,onItemTapped: onItemTapped,)
      ),
   );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  static const List<Widget> pages = <Widget>[
    HomePage(),
    CartPage(),
    ProfilePage(),
    //FavPage(),
  ];
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Stack(
      children: [
        Padding(
          padding:EdgeInsets.only(bottom: bottomPadding +8 ),
          child:pages[selectedIndex],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(onItemTapped:onItemTapped,selectedIndex:selectedIndex)),
      ],
    );
  }
}


