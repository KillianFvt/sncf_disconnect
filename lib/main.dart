import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/pages/main_section.dart';
import 'package:sncf_disconnect/providers/app_provider.dart';
import 'package:sncf_disconnect/widgets/appbar/appbar_item.dart';
import 'package:sncf_disconnect/widgets/appbar/bottom_appbar.dart';

void main() {
  runApp(const SNCFDisconnect());
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
      theme: ThemeData(
        primaryColor: sncfBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: sncfBlue,
          secondary: sncfLightBlue,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: sncfBlue,
          selectionColor: sncfLightBlue,
          selectionHandleColor: sncfLightBlue,
        )
      ),
      home: ChangeNotifierProvider(
        create: (context) => AppProvider(),
        builder: (context, child) {
          return Consumer<AppProvider>(
            builder: (context, appProvider, child) {
              return Theme(
                data: ThemeData(
                  primaryColor: sncfBlue,
                  scaffoldBackgroundColor: sncfDarkBlue,
                  fontFamily: "Avenir",
                ),
                child: DefaultTextStyle.merge(
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                  child: const Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainSection(),
                          BottomAppbar()
                        ],
                      ),
                    ),
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
