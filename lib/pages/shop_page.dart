import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uizard_study_app/components/coffee_tile.dart';
import 'package:uizard_study_app/models/coffee.dart';
import 'package:uizard_study_app/models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
// add to cart
  void addToCart(Coffee coffee) {
    // added to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // notification that the item is added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Succesfully Added to Cart!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
            ));

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        //SafeArea widget to ensure content is safe from system insets
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading message
              Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),

              // list of coffee to get

              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual coffee
                      Coffee eachCoffee = value.coffeeShop[index];

                      // return the tile for this coffee

                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: const Icon(Icons.add),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
