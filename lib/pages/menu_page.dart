import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurant/components/my_button.dart';
import 'package:sushirestaurant/components/my_food_tile.dart';
import 'package:sushirestaurant/models/shop.dart';
import 'package:sushirestaurant/pages/detail_page.dart';
import 'package:sushirestaurant/themes/color.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToDetailPage(int index) {
    Shop shop = context.read<Shop>();
    List foodItem = shop.getFoodItem();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(food: foodItem[index]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Shop shop = context.read<Shop>();
    List foodItem = shop.getFoodItem();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "TOKYO",
          style: GoogleFonts.dmSerifDisplay(),
        ),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_page');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get 20% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(text: "Redeem", onTap: () {})
                  ],
                ),
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 80,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here..."),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: axisDirectionToAxis(AxisDirection.left),
              itemCount: foodItem.length,
              itemBuilder: (context, index) {
                return MyFoodTile(
                  food: foodItem[index],
                  onTap: () => navigateToDetailPage(index),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SALMON EGGS",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 15),
                        ),
                        Text(
                          '\$20.99',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
