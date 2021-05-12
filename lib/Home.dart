import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Evaluate.dart';
import 'Button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String view = "";
  StackConversion e = StackConversion();
  void change(String text){
      setState(() {
        if(text =='=') {
          print('hi');
          List s1 = e.toPostFix(view);
          double c = e.evaluate(s1);
          print(c);
          if (c > 0) {
            if (c.compareTo(c.toInt()) >= 1) {
              view = c.toString();
            }
            else {
              view = c.toInt().toString();
            }
          }
          else {
            if ((c.toInt()).compareTo(c) >= 1) {
              view = c.toString();
            }
            else {
              view = c.toInt().toString();
            }
          }
        }
        else if(text =="C"){
          view ="";
        }
        else if(text =="DEL"){
          view = view.substring(0,view.length-1);
        }
        else{
          view = view + text;
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  alignment: Alignment.bottomRight,
                  child: Text(
                      view,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orange,
                      ),
                  ),
                ),
              ),
              Row(
                children: [
                  Button("C",change),
                  Button("*/-",change),
                  Button("%",change),
                  Button("DEL",change),
                ],
              ),
              Row(
                children: [
                  Button("7",change),
                  Button("8",change),
                  Button("9",change),
                  Button("/",change),
                ],
              ),
              Row(
                children: [
                  Button("4",change),
                  Button("5",change),
                  Button("6",change),
                  Button("*",change),
                ],
              ),
              Row(
                children: [
                  Button("1",change),
                  Button("2",change),
                  Button("3",change),
                  Button("-",change),
                ],
              ),
              Row(
                children: [
                  Button("0",change),
                  Button(".",change),
                  Button("=",change),
                  Button("+",change),
                ],
              ),
            ],
          ),


      );
  }
}

