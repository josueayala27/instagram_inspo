import 'dart:ui';

class PlantEntity {
  const PlantEntity(
      {required this.title,
      required this.category,
      required this.price,
      required this.color});

  final String title;
  final String category;
  final double price;
  final Color color;
}
