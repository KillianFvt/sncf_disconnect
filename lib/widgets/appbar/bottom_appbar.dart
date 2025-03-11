import 'package:flutter/material.dart';
import 'package:sncf_disconnect/widgets/appbar/appbar_item.dart';

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({super.key});

  @override
  State<BottomAppbar> createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {

  final List<String> _pages = ["Voyager", "Billets", "Offres", "Compte"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 58,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < _pages.length; i++)
                AppbarItem(title: _pages[i], index: i)
            ]
        )
    );
  }
}
