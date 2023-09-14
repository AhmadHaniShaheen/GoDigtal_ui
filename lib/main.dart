import 'package:bti_flutter/views/landscap_view.dart';
import 'package:bti_flutter/views/portrait_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation screenOrient = MediaQuery.of(context).orientation;
    if (screenOrient == Orientation.portrait) {
      return const PortriatView();
    } else {
      return const LandscapeView();
    }
  }
}

// ignore: must_be_immutable
class Meal extends StatefulWidget {
  String name;
  String image;
  List<Map> contents;
  bool isFavarit = false;
  Meal({
    super.key,
    required this.name,
    required this.image,
    required this.contents,
  });

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  List commits = [];
  bool isCommited = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 230,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('contents: '),
                        Text(
                            '${widget.contents.first['name'] + ', ' + widget.contents.last['name']}'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isFavarit = !widget.isFavarit;
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: widget.isFavarit ? Colors.red : Colors.grey,
                            size: 32,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Expanded(
                                          child: TextField(
                                            controller: controller,
                                            decoration: const InputDecoration(
                                                hintText: 'insert commite'),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            commits.add(controller.text);
                                            controller.clear();
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ]),
                                      const Text('Comments:'),
                                      ...commits.map((e) {
                                        return Text(e);
                                      }).toList(),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.comment,
                            color: Colors.grey,
                            size: 32,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text('price: '),
                    Text('${widget.contents.first['price']}'),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Content {
  String? name;
  int? price;
  Content(Map map) {
    name = map['name'];
    price = map['price'];
  }
}
