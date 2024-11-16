import 'package:flutter/material.dart';
import 'package:wisata_candi_nicowijaya/data/candi_data.dart';
import 'package:wisata_candi_nicowijaya/models/candi.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/profile_screen.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/search_screen.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/sign_in_screen.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/sign_up_screen.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/home_screen.dart';
import 'package:wisata_candi_nicowijaya/screen/lib/screens/Favorite_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      // home: ProfileScreen(),
      // home: DetailScreen(candi: candiList[0]),
      // home: SignInScreen(),
      // home: SignUpScreen(),
      // home: SearchScreen(),
      //home: HomeScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}
class _mainScreenState extends State<mainScreen> {
  // TODO: 1.Deklarasi Variabel
       int _currentIndex = 0;
       final List<Widget> _children = [
         HomeScreen(),
         SearchScreen(),
         FavoriteScreen(),
         ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2.  Buat Properti baru berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO: 3.  Buat Properti botttomNavigationBar dengan Nilai Theme
      bottomNavigationBar: Theme(
        // TODO: 4.  Buat data dan child dari theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.deepPurple,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple,),
            label: 'search',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple,),
              label: 'favorite',
            )
          ],
        ),
      ),
    );
  }
}
