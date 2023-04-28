import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statusbarz/statusbarz.dart';
import 'package:weather_news_app/pages/news_page.dart';
import 'package:weather_news_app/pages/weather_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Color brandColor = const Color(0XFF4166f5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;

      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
        lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
      }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: lightColorScheme.primary,
            foregroundColor: lightColorScheme.onPrimary,
            shadowColor: Colors.black.withOpacity(0.5),
          ),
        ),
        title: 'Weather News App',
        home: const MyHomePage(title: 'Weather News App'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.cloud),
            icon: Icon(Icons.cloud_outlined),
            label: 'Weather',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.newspaper),
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
        ],
      ),
      body: <Widget>[
        WeatherPage(),
        NewsPage(),
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}
