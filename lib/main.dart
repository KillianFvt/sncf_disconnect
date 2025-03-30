import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/pages/main_section.dart';
import 'package:sncf_disconnect/providers/app_provider.dart';
import 'package:sncf_disconnect/widgets/appbar/bottom_appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((value) => runApp(const SNCFDisconnect()));
}

class SNCFDisconnect extends StatefulWidget {
  const SNCFDisconnect({super.key});

  @override
  State<SNCFDisconnect> createState() => _SNCFDisconnectState();
}

class _SNCFDisconnectState extends State<SNCFDisconnect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNCF Disconnect',
      color: sncfBlue,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: appTheme,
      darkTheme: appTheme,
      home: ChangeNotifierProvider(
        create: (context) => AppProvider(),
        builder: (context, child) {
          return Consumer<AppProvider>(
            builder: (context, appProvider, child) {
              return const Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainSection(),
                      BottomAppbar()
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}

ThemeData appTheme = ThemeData(
  fontFamily: "Avenir",
  primaryColor: sncfBlue,
  scaffoldBackgroundColor: sncfDarkBlue,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: sncfBlue,
    secondary: sncfLightBlue,
  ),
  splashColor: sncfBlue.withValues(alpha: 0.25),
  highlightColor: sncfBlue.withValues(alpha: 0.25),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: sncfBlue,
    selectionColor: sncfLightBlue,
    selectionHandleColor: sncfLightBlue,
  ),
);
