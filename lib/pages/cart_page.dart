import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uizard_study_app/components/coffee_tile.dart';
import 'package:uizard_study_app/models/coffee.dart';
import 'package:uizard_study_app/models/coffee_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove item from the cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  // pay now
  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: ((context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      'Your Cart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            // get individual cart items
                            Coffee eachCoffee = value.userCart[index];

                            // return coffee tile
                            return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => removeFromCart(eachCoffee),
                                icon: Icon(Icons.delete));
                          }),
                    ),
                    GestureDetector(
                        onTap: payNow,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text("Pay Now",
                                  style: TextStyle(color: Colors.white))),
                        ))
                  ],
                ),
              ),
            )));
  }
}
