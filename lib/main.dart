import 'package:doctor/provider/feedback_posittion_provider.dart';

import 'package:doctor/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => FeedbackPositionProvider(),
    child: MaterialApp(
      title: 'Tinder Swiping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigationPage(),
    ),
  );
}
