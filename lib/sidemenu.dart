import 'package:black_scholes_model/backend/option_data.dart';
import 'package:black_scholes_model/common/number_input.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final OptionParameters options;
  final Function onChange;
  const SideMenu({super.key, required this.options, required this.onChange});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      child: Column(
        children: [
          const SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.graphic_eq),
                      Text(
                        "Black Scholes Model",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Text("Created by"),
                  Text("Dorj and Jadon")
                ],
              )),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberInputField(
                    labelText: "Current Asset Price",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.S = value.toDouble();
                        widget.onChange();
                      }
                    },
                  ),
                  NumberInputField(
                    labelText: "Strike Price",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.K = value.toDouble();
                      }
                      widget.onChange();
                    },
                  ),
                  NumberInputField(
                    labelText: "Time to Maturity(Years)",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.T = value.toDouble();
                      }
                      widget.onChange();
                    },
                  ),
                  NumberInputField(
                    labelText: "Volatility",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.sigma = value.toDouble();
                      }
                      widget.onChange();
                    },
                  ),
                  NumberInputField(
                    labelText: "Risk free interest rate",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.r = value.toDouble();
                      }
                      widget.onChange();
                    },
                  ),
                  NumberInputField(
                    labelText: "Dividend",
                    initialValue: 0,
                    onChanged: (value) {
                      if (!value.isNaN) {
                        widget.options.delta = value.toDouble();
                      }
                      widget.onChange();
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.white,
              child: const Text("To be implemented..."),
            ),
          ),
        ],
      ),
    );
  }
}
