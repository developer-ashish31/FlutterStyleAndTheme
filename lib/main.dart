import 'package:flutter/material.dart';
import 'package:theme_and_style/theme/my_colors.dart';
import 'package:theme_and_style/theme/my_theme.dart';
import 'package:theme_and_style/theme/theme_manager.dart';
import 'package:theme_and_style/utils/helper_widgets.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: _themeManager.themeMode /*ThemeMode.system*/,
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    // bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme App"),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/profile_pic.png",
                  width: 200,
                  height: 200,
                ),
                addVerticalSpace(10),
                Text(
                  "Ashish Kumar Kushwaha",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary /*MyColors.textColor
                      .platformBrightnessColor
                      (context)*/ /*isDark ? Colors.white :
                      Colors.black*/
                      ,
                      fontWeight: FontWeight.bold),
                ),
                addVerticalSpace(10),
                Text(
                  "Flutter Developer",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyColors.titleMediumColor
                          .platformBrightnessColor(context)),
                ),
                addVerticalSpace(10),
                Text(
                  "This is a simple Status",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: MyColors.titleSmallColor
                          .platformBrightnessColor(context)),
                ),
                addVerticalSpace(20),
                const TextField(),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        child: const Text("Just Click"), onPressed: () {}),
                    ElevatedButton(
                        child: const Text("Click Me"), onPressed: () {}),
                  ],
                ),
                addVerticalSpace(20),
                addVerticalSpace(20),
                Theme(
                    data: Theme.of(context).copyWith(
                      elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 20.0)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.secondaryColor
                                      .platformBrightnessColor(context)!))),
                    ),
                    child: ElevatedButton(
                        child: const Text("Close"), onPressed: () {})),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
