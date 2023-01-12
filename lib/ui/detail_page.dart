import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/restaurant.dart';

import '../data/model/menu.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  final Restaurant restaurant;

  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              leading: InkWell(
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pop(true);
                },
              ),
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: restaurant.image,
                  child: Image.network(
                    restaurant.image,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                  ),
                  child: Text(restaurant.name),
                ),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.description),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      padding: const EdgeInsets.all(6),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: restaurant.menu.map((menu) {
                        return _buildItem(context, menu);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(BuildContext context, Menu menu) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          menu.image,
          fit: BoxFit.cover,
          width: 400,
          height: 140,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        menu.name,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      Text(
        menu.price,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    ],
  );
}
