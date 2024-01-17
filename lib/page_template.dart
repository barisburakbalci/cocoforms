import 'package:cocoforms/pages/answers_page.dart';
import 'package:cocoforms/pages/customers_page.dart';
import 'package:cocoforms/pages/forms_page.dart';
import 'package:cocoforms/pages/profile_page.dart';
import 'package:cocoforms/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatefulWidget {
  const PageTemplate({super.key});

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  int _currentPage = 0;

  final List<Widget> _pages = <Widget>[
    const FormsPage(),
    const AnswersPage(),
    const CustomersPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: IndexedStack(
          index: _currentPage,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavbar(
          currentPage: _currentPage,
          onItemTapped: _onItemTapped,
        ),
      );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
