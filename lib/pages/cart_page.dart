import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurant/components/my_button.dart';
import 'package:sushirestaurant/models/food.dart';
import 'package:sushirestaurant/models/shop.dart';
import 'package:sushirestaurant/themes/color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Food item) {
    context.read<Shop>().remove(item);
  }

  double returnTotal(double total) {
    return total.roundToDouble().abs();
  }

  @override
  Widget build(BuildContext context) {
    List userCart = context.watch<Shop>().getUserCart();
    double total = context.read<Shop>().getTotal();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: userCart.isEmpty
                ? const Center(
                    child: Text(
                      "Cart is empty",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      Food cartItem = userCart[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 107, 54, 51),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: ListTile(
                          leading: Image.asset(cartItem.imagePath),
                          subtitle: Text(
                            cartItem.price,
                            style: const TextStyle(color: Colors.white),
                          ),
                          title: Text(
                            cartItem.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeFromCart(cartItem),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  '\$${returnTotal(total)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: MyButton(text: "Pay now", onTap: () {}),
          )
        ],
      ),
    );
  }
}
