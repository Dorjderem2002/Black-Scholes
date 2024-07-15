import 'package:flutter/material.dart';

class NumberInputField extends StatefulWidget {
  final String labelText;
  final int initialValue;
  final ValueChanged<int> onChanged;

  NumberInputField({
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  void increment() {
    setState(() {
      value++;
      widget.onChanged(value);
    });
  }

  void decrement() {
    setState(() {
      value--;
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      labelText: widget.labelText,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        value = int.tryParse(newValue) ?? value;
                        widget.onChanged(value);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: decrement,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: increment,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
