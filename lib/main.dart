import 'package:flutter/material.dart';
import 'package:manga_flutter/business_logic/bottom_app_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomAppBarWidget(),
    );
  }
}
