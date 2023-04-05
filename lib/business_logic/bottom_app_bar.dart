import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_flutter/business_logic/constante.dart';
import 'package:manga_flutter/screen/favoris.dart';
import 'package:manga_flutter/screen/home.dart';

class BottomAppBarWidget extends ConsumerWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: "Manga Collect",
      debugShowCheckedModeBanner: false,
      home: BottomAppBarWidgetState(),
    );
  }
}

class BottomAppBarWidgetState extends ConsumerStatefulWidget {
  const BottomAppBarWidgetState({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomAppBarWidgetStateState();
}

class _BottomAppBarWidgetStateState
    extends ConsumerState<BottomAppBarWidgetState> {
  final List<Widget> _widgetOptions = [];
  int _selectedIndex = 0;
  late String text;

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll([const HomeWidget(), const FavorisWidget()]);
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorAppBar,
          systemOverlayStyle: const SystemUiOverlayStyle(),
          title: const Text("Manga Collect"),
          centerTitle: true,
          elevation: 20.0,
          shadowColor: Colors.blueGrey,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              label: 'Favoris',
            ),
          ],
          selectedItemColor: colorButton,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: colorButton),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
