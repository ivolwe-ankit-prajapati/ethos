import 'package:ethos/modules/landingpage/view/landingpage_view.dart';
import 'package:ethos/size_config.dart';
import 'package:ethos/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'messages.dart';
import 'modules/auth/bindings/login_binding.dart';
import 'views/onboarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await GetStorage.init();
  //SharedPreferences.setMockInitialValues({});
  // Application.storageService = await LocalStorageService.getInstance();
  // Application.restApiService = await RestApiService.getInstance();
  getLanguage().whenComplete(() => runApp(MyApp()));

}
Locale? locale;
String? lang;
Future getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? languageCode = prefs.getString('languageCode');
  String? countryCode = prefs.getString('countryCode');
  print("one");
  if(languageCode=="de")
  {
    locale=Locale('de','DE');
    lang="de";
  }
  else if(languageCode=="fr")
    {
      locale=Locale('fr','FR');
      lang="fr";
    }
  else
    {
      locale=Locale('en','US');
      lang="en";
    }
  print("two");
  print(lang);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return OverlaySupport(
              child: GetMaterialApp(

                translations: LocaleString(),
                locale: lang=="de"?Locale('de','DE'):lang=="fr"?Locale('fr','FR'):Locale('en','EN'),
                // fallbackLocale: Locale('en','US'),
                debugShowCheckedModeBanner: false,
                title: 'Ethos',
                defaultTransition: Transition.zoom,
                initialBinding: LoginBinding(),
                theme: ThemeData(fontFamily: "Lato"),
                // theme: Themes.light,
                // darkTheme: Themes.dark,
                // themeMode: ThemeService().theme,
                home: SplashView(), //TestingPage//NewListingView//CheckInOutView//SplashView
              ),
            );
          },
        );
      },
    );

  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: OnboardingPage(),
//     );
//   }
// }
