import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/constants.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

class surah_builder extends StatefulWidget {
  final SuraName;
  final Sura;
  final arabic;
  int ayah;
  surah_builder(
      {Key? key, this.SuraName, this.Sura, this.arabic, required this.ayah})
      : super(key: key);

  @override
  State<surah_builder> createState() => _surah_builderState();
}

class _surah_builderState extends State<surah_builder> {
  bool view = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumpToAyah());
    super.initState();
  }

  jumpToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: Duration(seconds: 2),
          curve: Curves.easeInCubic);
    }
    fabIsClicked = false;
  }
  saveBookMark(Surah,Ayah)async{
    final pref=await SharedPreferences.getInstance();
    await pref.setInt('Surah', Surah);
    await pref.setInt('Ayah', Ayah);

  }
  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text_emlaey'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }


  SafeArea SingleSuraBuilder(LenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.Sura + 1 != 1) {
      for (int i = widget.Sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }




    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                (index != 0) || (widget.Sura == 0) || (widget.Sura == 8)
                    ? const Text('')
                    : const RetunBasmala(),
                Container(
                  color: index % 2 != 0
                      ? const Color.fromARGB(255, 253, 251, 240)
                      : const Color.fromARGB(255, 253, 247, 230),
                  child: PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: verseBuilder(index, previousVerses),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            saveBookMark(widget.Sura + 1, index);
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.bookmark_add,
                                color:
                                Color(0xff85a4e7),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Bookmark'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {

                          },
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.share,
                                color:
                                Color.fromARGB(255, 56, 115, 59),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Share'),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            );
          },
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: LenghtOfSura,
        )
            : ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.Sura + 1 != 1 && widget.Sura + 1 != 9
                          ? const RetunBasmala()
                          : const Text(''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fullSura,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mushafFontSize,
                            fontFamily: arabicFont,
                            color: const Color.fromARGB(196, 44, 44, 44),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    int LengthOfSura = noOfVerses[widget.Sura];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(

        backgroundColor: backgroundColor,
        appBar: AppBar(
            leading: Tooltip(
              message: 'Mushaf Mode',
              child: TextButton(
                child: const Icon(
                  Icons.chrome_reader_mode,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    view = !view;
                  });
                },
              ),
            ),
            centerTitle: true,
            title: Text(
              // widget.
              widget.SuraName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'quran',
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
            ),
            backgroundColor : Colors.white
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }
}
class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
