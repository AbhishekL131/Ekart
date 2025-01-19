import 'package:ekart/address_screen.dart';
import 'package:ekart/cart_item.dart';
import 'package:ekart/cart_page.dart';
import 'package:ekart/cart_provider.dart';
import 'package:ekart/checkoutscreen.dart';
import 'package:ekart/display_address.dart';
import 'package:ekart/global_variables.dart';
import 'package:ekart/home_screen.dart';
import 'package:ekart/product_details_page.dart';
import 'package:ekart/profile_screen.dart';
import 'package:ekart/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'address_provider.dart';
import 'firebase_auth_methods.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (context) => AddressProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            )
          )
        ),

        home: SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _page = 0;

  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    HomeScreen(),
    CartPage(),
    ProfileScreen(),
   // CheckoutScreen()
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(



      body: IndexedStack(
        children: pages,
        index: _page,
      ),



      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(245,247,249,1),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: onPageChanged,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,size: 30,),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,size: 30,),
              label: "My Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 30,),
              label: "Profile"
          ),
        ],
      ),



    );
  }
}



