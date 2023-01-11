import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/restaurant.dart';
import 'package:flutter_restaurant/ui/detail_page.dart';
import 'package:flutter_restaurant/ui/list_page.dart';

import 'common/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: textTheme,
      ),
      home: const ListPage(),
      routes: {
        DetailPage.routeName: (context) => DetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
