import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Color color;
  final String title;
  final String category;
  final double price;

  const HomeCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.price,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(color: color),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                      category),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$$price"),
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(5),
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.add),
                            color: Colors
                                .white, // Cambia el color del icono si es necesario
                            onPressed: () {
                              // Acción a realizar cuando se presione el botón
                            },
                          ))
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
