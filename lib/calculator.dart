import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class calc extends StatefulWidget {
  const calc({Key? key}) : super(key: key);

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  String _input = '';
  int num1=0;
  int num2=0;
  String symbol='';


  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _input = '';
      }
      else if(buttonText=='±'){
        if(int.parse(_input)>0){
          _input='-$_input';
        }
        else if(int.parse(_input)==0){
          _input='0';
        }
        else{
          _input=_input.substring(1);
        }

      }
      else {
        _input += buttonText;
      }
    });
  }

  double evalExpression(String expression) {
    // Use a library or implement your own expression evaluation logic
    // Here we'll use the 'eval_expressions' package as an example
    return double.parse(expression);
  }

  Widget buildButton(String buttonText, {Color color = Colors.black}) {
    return Expanded(
      child:RawMaterialButton(

        onPressed: () => _onButtonPressed(buttonText),
        elevation: 2.0,
        fillColor: Colors.grey[800],
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0,color: Colors.white),
        ),
      ),
    );
  }
  Widget buildButtontoprow(String buttonText, {Color color = Colors.black}) {
    return Expanded(
      child:RawMaterialButton(

        onPressed: () => _onButtonPressed(buttonText),
        elevation: 2.0,
        fillColor: Colors.grey[300],
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0,color: Colors.white),
        ),
      ),
    );
  }
  Widget buildButtonzero(String buttonText, {Color color = Colors.black}) {
    double buttonWidth=100.0;
    buttonText=buttonText+"     ";
    return SizedBox(

      width: buttonWidth * 2, // Set the width to match the combined width of two buttons
      child: RawMaterialButton(

        onPressed: () => _onButtonPressed(buttonText),
        elevation: 2.0,
        fillColor: Colors.grey[800],
        padding: EdgeInsets.symmetric(horizontal: 90,vertical: 20),

        shape: CircleBorder(),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, color: Colors.white),

        ),
      ),
    );
  }
  Widget buildbottonsymbol(String buttonText, {Color color = Colors.grey}) {
    return Expanded(
      child: RawMaterialButton(

        onPressed: ()=>{
          // print(_input),
          num1=int.parse(_input),
          print(num1),
          if(buttonText=='\u00F7'){
            symbol = '/',
          }
          else if(buttonText=='x'){
            symbol='*',
        }
          else{
      symbol=buttonText,
      },
          print(symbol),
          setState(() {
        _input = '';
          }),
        },
        elevation: 2.0,
        fillColor: Colors.orange,
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        // ) ,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0,color: Colors.white),
        ),
      ),
    );
  }
  Widget buildButtonequalto(String buttonText, {Color color = Colors.black}) {
    return Expanded(
      child: RawMaterialButton(
        padding: EdgeInsets.all(20.0),
        onPressed: () =>{
          num2=int.parse(_input),
          print(num2),
          if(symbol=='+'){
            num1=num1+num2,
          }
          else if(symbol=='-'){
            num1=num1-num2,
          }
          else if(symbol=='*'){
              num1=num1*num2,
            }
          else if(symbol=='/'){
                num1=num1~/num2,
              },

          setState(() {
            _input = num1.toString();
          }),
          // print(_input),
        },

        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0,color: Colors.white),
        ),
        elevation: 2.0,
        fillColor: Colors.orange,
        shape: CircleBorder(),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Column(

          children: [

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.black,
                alignment: Alignment.centerRight,
                child: Text(
                  _input,
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            // Divider(height: 0),
            Row(
              children: [

                buildButtontoprow('AC'),
                buildButtontoprow('±'),
                buildButtontoprow('%'),
                buildbottonsymbol('\u00F7', color: Colors.black),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildbottonsymbol('x', color: Colors.black),
              ],
            ),
            SizedBox(height: 10.0,),

            Row(
              children: [
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildbottonsymbol('-', color: Colors.black),
              ],
            ),
            SizedBox(height: 10.0,),

            Row(
              children: [
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildbottonsymbol('+', color: Colors.black),
              ],
            ),
            SizedBox(height: 10.0,),

            Row(
              children: [
                buildButtonzero('0'),
                buildButton('.'),
                buildButtonequalto('=', color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
