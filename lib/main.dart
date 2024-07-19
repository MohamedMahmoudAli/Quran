import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/IndexPage.dart';
import 'package:quran/constants.dart';

void main() {
  runApp(const MyApp());
}

List arabic=[];
List quran=[];
List malayalam=[];
Future readjson()async{
  final String response= await rootBundle.loadString("assets/hafs_smart_v8.json");
  final data =json.decode(response);
  arabic=data["quran"];
  malayalam=data["malayalam"];
  return quran=[arabic,malayalam];
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_)async {
       await readjson();
      await getSettings();
    });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(),
    );
  }
}

