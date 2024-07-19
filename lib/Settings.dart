import 'package:flutter/material.dart';
import 'package:quran/constants.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        // backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Arabic font Size",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
                Slider(value: arabicFontSize,
                    onChanged: (value){
                  setState(() {
                    arabicFontSize=value;
                  });
                    },
                    min: 20,
                    max:40,
                  // activeColor: primaryColor,
                ),
                Text("‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",style: TextStyle(
                    fontSize: arabicFontSize,
                    fontWeight: FontWeight.bold,
                  fontFamily: 'quran',

                ),
                  textDirection: TextDirection.rtl,
                ),
                Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                const Text(
                  'Mushaf Mode Font Size:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Slider(value: mushafFontSize,
                  onChanged: (value){
                    setState(() {
                      mushafFontSize=value;
                    });
                  },
                  min: 20,
                  max:50,
                  // activeColor: primaryColor,
                ),
                Text(
                  "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                  style: TextStyle(
                      fontFamily: 'quran', fontSize: mushafFontSize),
                  textDirection: TextDirection.rtl,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      arabicFontSize=28;
                      mushafFontSize=40;
                      saveSetting();
                    }, child: Text("Reset")),
                    ElevatedButton(onPressed: (){
                      saveSetting();
                      Navigator.of(context).pop();
                    }, child: Text("Save")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
