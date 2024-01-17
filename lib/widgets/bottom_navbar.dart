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
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.pending_actions_outlined),
          label: 'Formlar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_add_check_outlined),
          label: 'Sonuçlar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Müşteriler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ayarlar',
        ),
      ],
      currentIndex: currentPage,
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      onTap: onItemTapped,
    );
  }
}
