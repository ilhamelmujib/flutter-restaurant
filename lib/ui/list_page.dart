import 'package:flutter/material.dart';
import 'package:flutter_restaurant/ui/detail_page.dart';

import '../data/model/restaurant.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/restaurants.json"),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // loading widget
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              final List<Restaurant> restaurants =
                  parseRestaurant(snapshot.data);
              return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildItem(context, restaurants[index]);
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

Widget _buildItem(BuildContext context, Restaurant restaurant) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: restaurant);
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Hero(
            tag: restaurant.pictureId!,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Material(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minHeight: 100, maxWidth: 100),
                      child: Image.network(
                        restaurant.pictureId!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
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
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          restaurant.city!,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
