import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
class StackConversion{
  List toPostFix(String infix){
    String v = "";
    List a = ['+','-','/','%','*'];
    for(int i=0;i<infix.length;i++){
      String ch = infix.substring(i,i+1);
      if(a.contains(ch)){
        v = v + ',';
        v = v+ch;
        v = v+',';
      }
      else{
        v = v+ch;
      }
    }
    print(v);
    List b = v.split(',');
    print(b);
    List<String> stack = [''];
    List postfix = [];
    String ch;
    for(int i=0;i<b.length;i++){
      ch = b[i];
      print(ch);
      if(double.tryParse(ch) != null){
        postfix.add(ch);
      }
      else{
        while(priority(ch)<=priority(stack.last)){
          postfix .add(stack.removeLast());
        }
        stack.add(ch);
      }
    }
    while(!stack.isEmpty){
      postfix.add(stack.removeLast());
    }
    stack.add('');
    print(postfix);
    return postfix;
  }
  int priority(String ch){
    if(ch=='*'||ch=='/'||ch=='%')
      return 4;
    else if(ch=='+'||ch=='-')
      return 3;
    else
      return -1;
  }
  double evaluate(List postfix){
    List<double> stack = [0.0];
    double result = 0.0;
    for(int i=0;i<postfix.length;i++){
      String ch = postfix[i];
      if(double.tryParse(ch)!=null){
        stack.add(double.parse(ch));
      }
      else{
        double a = stack.removeLast();
        double b = stack.removeLast();
        switch(ch){
          case '+' : result = b+a;break;
          case '-' : result = b-a;break;
          case '*' : result = b*a;break;
          case '/' : result = b/a;break;
          case '%' : result = b%a;break;
        }
        stack.add(result);
      }
    }
    return stack.last;
  }
}