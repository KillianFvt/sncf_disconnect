import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sncf_disconnect/pages/home_page.dart';
import 'package:sncf_disconnect/providers/app_provider.dart';
import 'package:sncf_disconnect/constants/colors.dart';

class MainSection extends StatefulWidget {
  const MainSection({super.key});

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> with SingleTickerProviderStateMixin {
  late final List<Widget> _pages;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  int _currentIndex = 0;
  int _nextIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      const KeepAlivePage(child: HomePage()),
      const KeepAlivePage(child: SecondPage()),
      const KeepAlivePage(child: ThirdPage()),
      const KeepAlivePage(child: FourthPage()),
    ];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          if (_currentIndex != appProvider.currentPageIndex && !_animationController.isAnimating) {
            _nextIndex = appProvider.currentPageIndex;
            _animationController.forward().then((_) {
              setState(() {
                _currentIndex = _nextIndex;
              });
              _animationController.reverse();
            });
          }

          return FadeTransition(
            opacity: _fadeAnimation.drive(
              Tween<double>(begin: 0.0, end: 1.0),
            ),
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          );
        },
      ),
    );
  }
}

// KeepAlivePage to maintain state
class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

// Placeholder pages
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Second Page',
        style: TextStyle(color: sncfAWhite, fontSize: 24),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Third Page',
        style: TextStyle(color: sncfAWhite, fontSize: 24),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Fourth Page',
        style: TextStyle(color: sncfAWhite, fontSize: 24),
      ),
    );
  }
}