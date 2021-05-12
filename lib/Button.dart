import 'package:flutter/material.dart';

import 'Home.dart';
class Button extends StatelessWidget {
  String text="";
  Function change;
  List a = ['/','*','-','+'];
  Button(String text,Function change){
    this.text = text;
    this.change = change;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child : Text(
          text,
          style: TextStyle(
              fontSize: 30,
            color: a.contains(text)?Colors.orange:Colors.black,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        onPressed: (){
          change(text);
        },
        color: text == '='?Colors.orange:(a.contains(text)?Colors.grey[200]:Colors.white),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[400],width: 1),
        ),
      ),
    );
  }
}
