import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLaguage extends StatelessWidget {

  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'Deutsch','locale': Locale('de','DE')},
    {'name':'French','locale': Locale('fr','FR')},
  ];

  updateLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(locale.toString()=="en_US")
      {
        prefs.setString("countryCode", "US");
        prefs.setString("languageCode", "en");
        print("eng");
      }
    else if(locale.toString()=="de_DE")
      {
        prefs.setString("countryCode", "DE");
        prefs.setString("languageCode", "de");
        print("german");
      }
    else
      {
        prefs.setString("countryCode", "FR");
        prefs.setString("languageCode", "fr");
        print("french");
      }
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Select Language'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                        print(locale[index]['locale']);
                        updateLanguage(locale[index]['locale']);

                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
         leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                {
                  Get.back();
                }
              }),
          title: Text('Select Language'.tr,style: TextStyle(fontSize: 24,color: Colors.black),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('English'.tr,style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              // Text('English'.tr,style: TextStyle(fontSize: 20),),
              // SizedBox(height: 10,),
              // Text('English'.tr,style: TextStyle(fontSize: 20),),

              ElevatedButton(
                  onPressed: (){
                    buildLanguageDialog(context);
                  }, child: Text('Select Language'.tr)
              ),
            ],
          ),
        )
    );
  }
}