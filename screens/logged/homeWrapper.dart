import 'package:fipstack/screens/logged/homeScreen.dart';
import 'package:fipstack/screens/logged/trendingScreen.dart';
import 'package:fipstack/services/authService.dart';
import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> myPages = [
      HomeScreen(),
      TrendingScreen(),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: TabBarView(children: myPages),
      ),
    );
  }
}
