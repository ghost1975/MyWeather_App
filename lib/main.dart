/** import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/weatherProvider.dart';
import 'screens/homeScreen.dart';
import 'screens/fiveDayForecastDetailScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather Forecast',
        debugShowCheckedModeBanner: false,
        // TODO {запрограмувати вибір теми в залежносоті від часу доби}


        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 0,
          ),

          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        // TODO {Цей блок замінити на функцію, яка змінює тему}
        home: HomeScreen(),
        // routes: {
        //   WeeklyScreen.routeName: (ctx) => WeeklyScreen(),
        // },
        onGenerateRoute: (settings) {
          final arguments = settings.arguments;
          if (settings.name == FiveDayForecastDetail.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => FiveDayForecastDetail(
                initialIndex: arguments == null ? 0 : arguments as int,
              ),
              transitionsBuilder: (ctx, a, b, c) => CupertinoPageTransition(
                primaryRouteAnimation: a,
                secondaryRouteAnimation: b,
                linearTransition: false,
                child: c,
              ),
            );
          }
          // Unknown route
          return MaterialPageRoute(builder: (_) => HomeScreen());
        },
      ),
    );
  }
}
**/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './provider/weatherProvider.dart';
import 'screens/homeScreen.dart';
import 'screens/fiveDayForecastDetailScreen.dart';

import 'package:intl/intl.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather Forecast',
        debugShowCheckedModeBanner: false,
        theme: _getThemeData(context),
        home: HomeScreen(),
        onGenerateRoute: (settings) {
          final arguments = settings.arguments;
          if (settings.name == FiveDayForecastDetail.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => FiveDayForecastDetail(
                initialIndex: arguments == null ? 0 : arguments as int,
              ),
              transitionsBuilder: (ctx, a, b, c) => CupertinoPageTransition(
                primaryRouteAnimation: a,
                secondaryRouteAnimation: b,
                linearTransition: false,
                child: c,
              ),
            );
          }
          // Unknown route
          return MaterialPageRoute(builder: (_) => HomeScreen());
        },
      ),
    );
  }

  ThemeData _getThemeData(BuildContext context) {
    final now = TimeOfDay.now().hour;
    final isDarkMode = now < 6 || now > 18;

    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkMode ? Colors.indigo : Colors.white,
        iconTheme: IconThemeData(color: isDarkMode ? Colors.indigo : Colors.blue),
        elevation: 0,
      ),
      scaffoldBackgroundColor: isDarkMode ? Colors.indigo : Colors.white,
      primaryColor: isDarkMode ? Colors.white : Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: isDarkMode ? Colors.indigo : Colors.white,
      ),
    );
  }
}