import 'package:flutter/material.dart';
import 'package:instagram_inspo/widgets/clipped_text.dart';
import 'package:instagram_inspo/widgets/home_card.dart';
import 'package:instagram_inspo/widgets/home_filter.dart';

class Plant {
  String title;
  String category;
  double price;
  Color color;

  Plant(
      {required this.title,
      required this.category,
      required this.price,
      required this.color});
}

class Filter {
  int id;
  String title;
  bool isSelected;

  Filter({required this.id, required this.title, required this.isSelected});
}

final List<Filter> filters = [
  Filter(id: 1, title: "All", isSelected: true),
  Filter(id: 2, title: "Flowers", isSelected: false),
  Filter(id: 3, title: "Indoor", isSelected: false),
  Filter(id: 4, title: "Office Plants", isSelected: false),
  Filter(id: 5, title: "House Plants", isSelected: false),
];

final List<Plant> plants = [
  Plant(
      title: 'Monstera Deliciosa',
      category: 'Interior',
      price: 29.99,
      color: Colors.black),
  Plant(
      title: 'Ficus lyrata',
      category: 'Interior',
      price: 39.99,
      color: Colors.amber),
  Plant(
      title: 'Cactus Espinoso',
      category: 'Succulenta',
      price: 14.99,
      color: Colors.lightBlue),
  Plant(
      title: 'Orquídea Phalaenopsis',
      category: 'Orquídeas',
      price: 24.99,
      color: Colors.orange),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(color: Colors.black, Icons.menu),
          actions: [
            IconButton(
              icon: const Icon(
                  color: Colors.black,
                  Icons.notifications_on_outlined), // Icono derecho
              onPressed: () {
                // Acción cuando se presiona el icono derecho
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const ClippedText(["Find Your", "House Plants!"]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: filters.map((
                    filter,
                  ) {
                    return Row(
                      children: [
                        HomeFilter(
                            title: filter.title, isSelected: filter.isSelected),
                        SizedBox(
                          width: filter.title != 'House Plants' ? 10 : 0,
                        ),
                      ],
                    );
                  }).toList()),
                ),
              ),
              GridView.builder(
                itemCount: plants.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 1.2),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return HomeCard(
                    price: plants[index].price,
                    category: plants[index].category,
                    title: plants[index].title,
                    color: plants[index].color,
                  );
                },
              )
            ],
          ),
        ));
  }
}
