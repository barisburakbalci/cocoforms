import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.currentPage,
    required this.onItemTapped,
  });

  final int currentPage;
  final Function(int) onItemTapped;

  Widget _bottomNavbarIconBuilder({
    required IconData icon,
    bool isSelected = false,
  }) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.4,
            child: Container(
              color: isSelected ? Colors.blue : Colors.transparent,
              height: 3,
            ),
          ),
          const SizedBox(height: 8.0),
          Icon(icon),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32.0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _bottomNavbarIconBuilder(icon: Icons.pending_actions_outlined),
          activeIcon: _bottomNavbarIconBuilder(
            icon: Icons.pending_actions,
            isSelected: true,
          ),
          label: 'Formlar',
        ),
        BottomNavigationBarItem(
          icon: _bottomNavbarIconBuilder(icon: Icons.query_stats_outlined),
          activeIcon: _bottomNavbarIconBuilder(
            icon: Icons.query_stats,
            isSelected: true,
          ),
          label: 'Sonuçlar',
        ),
        BottomNavigationBarItem(
          icon: _bottomNavbarIconBuilder(icon: Icons.people_outline),
          activeIcon: _bottomNavbarIconBuilder(
            icon: Icons.people,
            isSelected: true,
          ),
          label: 'Müşteriler',
        ),
        BottomNavigationBarItem(
          icon: _bottomNavbarIconBuilder(icon: Icons.person_outline),
          activeIcon: _bottomNavbarIconBuilder(
            icon: Icons.person,
            isSelected: true,
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
