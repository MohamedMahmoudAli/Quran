import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          DrawerHeader(child: Column(
            children: [
              Image.asset("assets/quran.png",height: 80,),
              Text("AL Quran",style: TextStyle(fontSize: 20),)
            ],
          )),
          ListTile(
            leading: Icon(
              Icons.settings
            ),
            title: Text("Settings"),
            onTap: (){
              Navigator.pop(context);
              // Get.to(Settings());
            },
          ),
          ListTile(
            leading: Icon(
                Icons.share
            ),
            title: Text("Share"),
            onTap: (){
              Share.share(''''*quran app*\n'
                  u can devlop it ''');
              Navigator.pop(context);

            },
          ),
          ListTile(
            leading: Icon(
                Icons.rate_review
            ),
            title: Text("Rate"),
            onTap: ()async{
              // if(! await launchUrl(
              //   mode: LaunchMode.externalApplication
              // )){
              //   throw
              // }

            },
          )
        ],
      ),
    );
  }
}
