import 'package:black_scholes_model/backend/black_scholas.dart';
import 'package:black_scholes_model/backend/option_data.dart';
import 'package:black_scholes_model/common/price_box.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final OptionParameters options;
  const Home({super.key, required this.options});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BlackScholes blackScholes = BlackScholes();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(245, 245, 245, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Black Scholes Pricing Model",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: PriceBox(
                      color: Colors.green,
                      title: "CALL Value",
                      value: blackScholes.calculateOptionPrice(
                          widget.options, "call"))),
              Expanded(
                  child: PriceBox(
                      color: Colors.red,
                      title: "PUT Value",
                      value: blackScholes.calculateOptionPrice(
                          widget.options, "put")))
            ],
          ),
        ],
      ),
    );
  }
}
