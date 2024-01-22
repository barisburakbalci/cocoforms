import 'dart:developer';

import 'package:cocoforms/pages/answers_page.dart';
import 'package:cocoforms/pages/customers_page.dart';
import 'package:cocoforms/pages/forms_page.dart';
import 'package:cocoforms/pages/profile_page.dart';
import 'package:cocoforms/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cocoforms/variables.dart' as vars;

class PageTemplate extends StatefulWidget {
  const PageTemplate({super.key});

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  int _currentPage = 0;
  bool isServerHealthy = false;

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

  Future<bool> pingServer() async {
    var response = await http.get(Uri.parse('${vars.baseUrl}Form'));
    return response.body.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    pingServer().then((value) => setState(() => isServerHealthy = value));
  }

  @override
  Widget build(BuildContext context) {
    try {
      return isServerHealthy
          ? Scaffold(
              body: IndexedStack(
                index: _currentPage,
                children: _pages,
              ),
              bottomNavigationBar: BottomNavbar(
                currentPage: _currentPage,
                onItemTapped: _onItemTapped,
              ),
            )
          : const Scaffold(
              body: Center(
                child: Text(
                  'Sunucu hatası!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
