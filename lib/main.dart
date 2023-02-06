import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/view/IndexPage.dart';
import 'package:quran/view/constants.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const IndexPage(),
    );
  }
}

