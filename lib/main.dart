import 'package:extra_work1/homepage/HomePage.dart';
import 'package:extra_work1/showpage/ShowData.dart';
import 'package:flutter/material.dart';

import 'Filepage/fileDetails.dart';
import 'edilpage/editPage.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomePage(),
        '/file' : (context) => const fileDetails(),
        '/edit' : (context) => const editPage(),
        '/show' : (context) => const ShoeData(),
      },
    );
  }
}
