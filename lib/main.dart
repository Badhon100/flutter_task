import 'package:flutter/material.dart';
import 'package:flutter_task/provider/product_details_provider.dart';
import 'package:flutter_task/provider/search_result_provider.dart';
import 'package:flutter_task/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchResultProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Test',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: SearchScreen(),
      ),
    );
  }
}

