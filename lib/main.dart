import 'package:flutter/material.dart';
import 'package:light_dark_theme_switcher/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'components/change_theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Light & Dark Theme';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: title,
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const MyHomePage(),
          );
        },
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // //*check what the system theme mode is
    // final whatTheme =
    //     MediaQuery.of(context).platformBrightness == Brightness.dark
    //         ? 'Dark Theme'
    //         : 'Light Theme';

    //*check what theme is selected
    final whatTheme =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? 'Dark Theme'
            : 'Light Theme';

    return Scaffold(
      appBar: AppBar(
        title: Text('Light and Dark Themes Switcher'),
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              whatTheme,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
