import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vokabel_trainer/pages/add_vocabulary_screen.dart';
import 'package:vokabel_trainer/pages/home_screen.dart';
import 'package:vokabel_trainer/pages/my_vocabulary_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
      value) => runApp(const MyApp())
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Vokabel Trainer",
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final pages = [const HomeScreen(), const AddVocabularyScreen(), const MyVocabularyScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vokabeltrainer"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: pages[index],
      ),
      bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.add), label: "Vokabel Hinzufügen"),
            NavigationDestination(icon: Icon(Icons.book), label: "Meine Vokabeln")
          ],
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() {
                index = value;
              })),
    );
  }
}
