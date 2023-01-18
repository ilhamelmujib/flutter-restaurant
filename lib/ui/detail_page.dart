import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/restaurant.dart';

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
                  tag: restaurant.pictureId!,
                  child: Image.network(
                    restaurant.pictureId!,
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
                  child: Text(restaurant.name!),
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
                        Flexible(
                          child: Text(
                            restaurant.city!,
                            maxLines: 1,
                            style: const TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rating ${restaurant.rating!}",
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(restaurant.description!),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Makanan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurant.menus!.foods!.map((menu) {
                        return _buildItem(context, menu!);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Minuman",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: restaurant.menus!.drinks!.map((menu) {
                        return _buildItem(context, menu!);
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

Widget _buildItem(BuildContext context, Food food) {
  return Text(
    "- ${food.name!}",
    style: const TextStyle(
      fontSize: 16,
    ),
  );
}
