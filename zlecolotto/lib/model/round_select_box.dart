import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundSelectBox extends StatefulWidget {
  const RoundSelectBox({Key? key}) : super(key: key);

  @override
  _RoundSelectBoxState createState() => _RoundSelectBoxState();
}

class _RoundSelectBoxState extends State<RoundSelectBox> {

// Initial Selected Value
    String dropdownvalue = '1000회';

// List of items in our dropdown menu
    var items = [
      '1000회',
      '1001회',
      '1002회',
      '1003회',
      '1004회',
    ];
    
    @override
    Widget build(BuildContext context) {
      return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items,
                    style: TextStyle(
                      fontSize: 18,
                    ),),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
        );
    }
  }
