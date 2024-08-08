import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushirestaurant/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              food.imagePath,
              height: 120,
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    Text(
                      food.rating,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
