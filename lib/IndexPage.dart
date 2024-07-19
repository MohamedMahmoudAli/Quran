import 'package:flutter/material.dart';
import 'package:quran/arabic_surah_number.dart';
import 'package:quran/constants.dart';
import 'package:quran/main.dart';
import 'package:quran/surah_builder.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "go to bookmark",
        child: Icon(Icons.bookmark),
        backgroundColor: backgroundColor,
        onPressed: () async {
          // fabIsClicked=true;
          if (await readBookmark()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                          ayah: bookmarkedAyah,
                          Sura: bookmarkedSura,
                          arabic: quran[0],
                          SuraName: arabicName[bookmarkedSura - 1]['name'],
                        )));
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quran",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ]),
        ),
      ),
      body: FutureBuilder(
          future: readjson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: SingleChildScrollView());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else if (snapshot.hasData) {
                return indexCreator(snapshot.data, context);
              } else {
                return Text('Empty Data');
              }
            } else {
              return Text(" state:${snapshot.connectionState}");
            }
          }),
    );
  }
}

Container indexCreator(quran, context) {
  return Container(
    color: const Color.fromARGB(255, 221, 250, 236),
    child: ListView(
      children: [
        for (int i = 0; i < 114; i++)
          Container(
            color: i % 2 == 0
                ? const Color.fromARGB(255, 253, 247, 230)
                : const Color.fromARGB(255, 253, 251, 240),
            child: TextButton(
              child: Row(
                children: [
                  ArabicSuraNumber(i: i),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    arabicName[i]['name'],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 130, 130, 130),
                          )
                        ]),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              onPressed: () {
                // fabIsClicked = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                            arabic: quran[0],
                            Sura: i,
                            SuraName: arabicName[i]['name'],
                            ayah: 0,
                          )),
                );
              },
            ),
          ),
      ],
    ),
  );
}
