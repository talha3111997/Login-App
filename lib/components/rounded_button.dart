import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key key , this.text, this.press, this.color, this.textColor
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
            onPressed: press,
            child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
            style: TextButton.styleFrom(
                backgroundColor: color,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)

            )


        ),
      ),
    );

  }
}

