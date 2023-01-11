import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/model/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  final Restaurant restaurant;
  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.image,
              child: Image.network(restaurant.image),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.description),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${restaurant.rating}'),
                  const SizedBox(height: 10),
                  Text('Author: ${restaurant.name}'),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurant.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read more'),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}