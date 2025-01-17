import 'package:cocoforms/core/views/widgets/bottom_navbar.dart';
import 'package:cocoforms/features/form/views/screens/forms_screen.dart';
import 'package:cocoforms/features/groups/views/groups_screen.dart';
import 'package:cocoforms/features/profile/views/profile_screen.dart';
import 'package:cocoforms/features/reports/views/reports_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final List<Widget> _pages = <Widget>[
    const FormsScreen(),
    const ReportsScreen(),
    const GroupsScreen(),
    const ProfileScreen(),
  ];

  int _currentPageIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavbar(
        currentPage: _currentPageIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
