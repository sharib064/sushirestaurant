import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Color.fromARGB(
                      255,
                      138,
                      60,
                      55,
                    ),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 138, 60, 55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
