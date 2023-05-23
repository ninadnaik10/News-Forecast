import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_forecast/pages/news_page.dart';
import 'package:news_forecast/pages/weather_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  //Setting SysemUIOverlay
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     // systemStatusBarContrastEnforced: true,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //     // statusBarIconBrightness: Brightness.dark
  //   )
  // );

//Setting SystmeUIMode
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

late ColorScheme lightColorScheme;
Color brandColor = const Color(0XFFFFFFFF);
late SystemUiOverlayStyle navigationBarStyle;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      final Color primaryColor =
          Theme.of(context).primaryColor ?? Colors.transparent;
      if (lightDynamic != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
      }
      navigationBarStyle = const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
      );

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(bodyMedium: GoogleFonts.openSans()),
          useMaterial3: true,
          colorScheme: lightColorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: lightColorScheme.primary,
            foregroundColor: lightColorScheme.onPrimary,
            shadowColor: Colors.black.withOpacity(0.5),
          ),
        ),
        title: 'Weather News App',
        home: const MyHomePage(title: 'News Forecast'),
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
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(navigationBarStyle);
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("About"),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'News Forecast by Ninad Naik',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () => launchUrl(
                                Uri.parse(
                                    'https://github.com/ninadnaik10/News-Forecast'),
                                mode: LaunchMode.externalApplication),
                            icon: const FaIcon(FontAwesomeIcons.github),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showLicensePage(context: context, applicationName: "News Forecast");
                              },
                              child: const Text("Licenses"))
                          // IconButton(onPressed: () => launchUrl(Uri.parse('https://github.com/ninadnaik10/News-Forecast')), icon: const FaIcon(FontAwesomeIcons.github))
                        ],
                      ),
                    ),
                  );
                }));
              },
              icon: const Icon(Icons.info_outline))
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
      body: <Widget>[const WeatherPage(), const NewsPage()][currentPageIndex],
    );
  }
}
