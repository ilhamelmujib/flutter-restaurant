import 'package:flutter/material.dart';
import 'package:flutter_restaurant/ui/detail_page.dart';

import '../data/model/restaurant.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/restaurants.json"),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
          return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildItem(context, restaurants[index]);
              });
        },
      ),
    );
  }
}

Widget _buildItem(BuildContext context, Restaurant restaurant) {
  return Material(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Hero(
        tag: restaurant.image,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                restaurant.image,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
            Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(restaurant.rating.toString())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.address),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
    ),
  );
}
