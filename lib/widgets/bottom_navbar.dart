import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.currentPage,
    required this.onItemTapped,
  });

  final int currentPage;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32.0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.pending_actions_outlined),
          activeIcon: Icon(Icons.pending_actions),
          label: 'Formlar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.query_stats_outlined),
          activeIcon: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Container(
                    color: Colors.blue,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Icon(Icons.query_stats),
              ],
            ),
          ),
          label: 'Sonuçlar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          activeIcon: Icon(Icons.people),
          label: 'Müşteriler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Container(
                    color: Colors.blue,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Icon(Icons.person),
              ],
            ),
          ),
          label: 'Profil',
        ),
      ],
      currentIndex: currentPage,
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      onTap: onItemTapped,
    );
  }
}
