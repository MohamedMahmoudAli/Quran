// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SurahScreen(),
//     );
//   }
// }

// class SurahScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String jsonData = '''
//     {
//       "index": "001",
//       "name": "al-Fatihah",
//       "verse": {
//           "verse_1": "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
//           "verse_2": "ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ",
//           "verse_3": "ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
//           "verse_4": "مَٰلِكِ يَوْمِ ٱلدِّينِ",
//           "verse_5": "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
//           "verse_6": "ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ",
//           "verse_7": "صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ"
//       },
//       "count": 7,
//       "juz": [
//           {
//               "index": "01",
//               "verse": {
//                   "start": "verse_1",
//                   "end": "verse_7"
//               }
//           }
//       ]
//     }
//     ''';

//     Map<String, dynamic> parsedJson = jsonDecode(jsonData);
//     Surah surah = Surah.fromJson(parsedJson);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(surah.name),
//       ),
//       body: ListView.builder(
//         itemCount: surah.verse.length,
//         itemBuilder: (context, index) {
//           String verseKey = 'verse_${index + 1}';
//           return ListTile(
//             title: Text(surah.verse[verseKey] ?? ''),
//           );
//         },
//       ),
//     );
//   }
// }
