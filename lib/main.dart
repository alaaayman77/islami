import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadeth_details_screen.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/quran/sura_details_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen()
        },
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: provider.appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.appLanguage));
  }

  Future<void> initSharedPref() async {
    final _prefs = await SharedPreferences.getInstance();
    var language = _prefs.getString("language");
    if (language != null) {
      provider.changeLanguage(language);
    }
    var isDark = _prefs.getString("Theme");
    if (isDark == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    } else if (isDark == 'light') {
      provider.changeTheme(ThemeMode.light);
    }
  }
}
