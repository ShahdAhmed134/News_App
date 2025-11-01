import 'package:flutter/material.dart';
import 'package:news_application/app_config_provider.dart';
import 'package:news_application/home/home_screen.dart';
import 'package:news_application/theme_app.dart';
import 'package:provider/provider.dart';
import 'home/news/news_details.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) =>AppConfigProvider(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsDetails.routeName : (context) => NewsDetails()

      },
      locale: Locale(appProvider.language),

    );
  }
}
