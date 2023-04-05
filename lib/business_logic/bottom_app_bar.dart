import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:manga_flutter/business_logic/constante.dart';
import 'package:manga_flutter/provider/mangas_provider.dart';
import 'package:manga_flutter/repository/mangas_repository.dart';
import 'package:manga_flutter/screen/favoris.dart';
import 'package:manga_flutter/screen/home.dart';

class BottomAppBarWidget extends ConsumerWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Manga Collect",
      debugShowCheckedModeBanner: false,
      home: const BottomAppBarWidgetState(),
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
  late bool mode;
  late String text;

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll([const HomeWidget(), const FavorisWidget()]);
    mode = false;
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, ref),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: bottomAppBar(_selectedIndex, _onItemTapped));
  }
}

PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
  return AppBar(
    backgroundColor: colorAppBar,
    systemOverlayStyle: const SystemUiOverlayStyle(),
    title: const Text("Manga Collect"),
    centerTitle: true,
    elevation: 20.0,
    shadowColor: Colors.blueGrey,
  );
}

Widget bottomAppBar(int selectedIndex, Function(int)? onItemTapped) {
  return BottomNavigationBar(
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
    currentIndex: selectedIndex,
    onTap: onItemTapped,
  );
}
