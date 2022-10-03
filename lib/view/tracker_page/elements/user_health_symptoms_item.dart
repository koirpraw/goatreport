import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef StringValue = void Function(String);

class UserHealthSymptomsItem extends StatefulWidget {
  final StringValue valueChanged;

  const UserHealthSymptomsItem({Key? key, required this.valueChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UserHealthSymptomsItemState();
}

class UserHealthSymptomsItemState extends State<UserHealthSymptomsItem> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
              icon: new Icon(Icons.remove),
              onPressed: () {
                if (_itemCount > 0) {
                  setState(() {
                    _itemCount--;
                  });
                  widget.valueChanged(_itemCount.toString());
                }
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            _itemCount.toString(),
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
              icon: new Icon(
                Icons.add,
              ),
              onPressed: () {
                if(_itemCount < 5){
                  setState(() {
                    _itemCount++;
                    widget.valueChanged(_itemCount.toString());
                  });
                }
              }),
        ),
      ],
    );
  }
}
