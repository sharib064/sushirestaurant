import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurant/components/my_button.dart';
import 'package:sushirestaurant/models/food.dart';
import 'package:sushirestaurant/models/shop.dart';
import 'package:sushirestaurant/themes/color.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void addToCart() {
    if (counter > 0) {
      context.read<Shop>().addUserCart(widget.food, counter);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          title: const Text(
            "Successfully added to cart",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Delicately sliced, fresh atlantic salmon drapes elegantly over a pillow of perfectly seasoned pillow of rice",
                    style: TextStyle(
                        height: 2, color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => decrementCounter(),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.remove,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              counter.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => incrementCounter(),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(text: "Add to Cart", onTap: () => addToCart())
              ],
            ),
          )
        ],
      ),
    );
  }
}
