import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.text, this.onPress, this.color, this.tag});

  //text -> be displayed in the button
  //onPress -> the function to be executed when the button is pressed
  //color -> color of the button
  //tag -> tag for hero animation
  final String text;
  final Function onPress;
  final Color color;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: Hero(
          tag: tag,
          child: MaterialButton(
            onPressed: onPress,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
