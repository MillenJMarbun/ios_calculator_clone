import 'package:flutter/material.dart';

class SharedWidget {
  static Widget circlebutton({
    required VoidCallback onClick,
    required String text,
    Color textColor = Colors.white,
    Color color = Colors.white38,
  }) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          onClick();
        },
        child: Text(text, style: TextStyle(fontSize: 30, color: textColor)),
        style: ElevatedButton.styleFrom(
            primary: color, shape: CircleBorder(), minimumSize: Size(65, 65)),
      ),
    );
  }
}
