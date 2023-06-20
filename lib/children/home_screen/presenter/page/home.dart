import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_inspo/children/home_screen/data/models/plant_model.dart';
import 'package:instagram_inspo/children/home_screen/presenter/bloc/new_home_bloc.dart';
import 'package:instagram_inspo/children/home_screen/presenter/page/widgets/clipped_text.dart';
import 'package:instagram_inspo/children/home_screen/presenter/page/widgets/home_card.dart';
import 'package:instagram_inspo/children/home_screen/presenter/page/widgets/home_filter.dart';

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

final List<PlantModel> plants = [
  PlantModel(
      title: 'Monstera Deliciosa',
      category: 'Interior',
      price: 29.99,
      color: Colors.black),
  PlantModel(
      title: 'Ficus lyrata',
      category: 'Interior',
      price: 39.99,
      color: Colors.amber),
  PlantModel(
      title: 'Cactus Espinoso',
      category: 'Succulenta',
      price: 14.99,
      color: Colors.lightBlue),
  PlantModel(
      title: 'Orquídea Phalaenopsis',
      category: 'Orquídeas',
      price: 24.99,
      color: Colors.orange),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewHomeBloc>(
      create: (context) => NewHomeBloc(),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewHomeBloc, NewHomeState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

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
        child: BlocBuilder<NewHomeBloc, NewHomeState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                BlocBuilder<NewHomeBloc, NewHomeState>(
                  builder: (context, state) {
                    if (state is NewFilterNameState) {
                      return ClippedText([state.updatedName]);
                    } else {
                      return const ClippedText(['', "House Plants!"]);
                    }
                  },
                ),
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
                          InkWell(
                            onTap: () {
                              BlocProvider.of<NewHomeBloc>(context).add(
                                ChangeFilterEvent(filterName: filter.title),
                              );
                            },
                            child: HomeFilter(
                              title: filter.title,
                              isSelected: true,
                            ),
                          ),
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
            );
          },
        ),
      ),
    );
  }
}
