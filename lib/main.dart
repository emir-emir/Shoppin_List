import 'package:flutter/material.dart';
import 'package:shopping_list/widget/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 220, 189, 252));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: mainTheme,
      home: GroceryList(),
    );
  }

  ThemeData get mainTheme {
    return ThemeData().copyWith(
      useMaterial3: true,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252),
      cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    );
  }
}
