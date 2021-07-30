import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double result = 0.0;
  int sumTimer = 0;
  double heightSliderValue = 170.0;
  double wightSliderValue = 75.0;
  bool male = true;
  bool cal = false;
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle subTitleStyle = TextStyle(
      fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: w,
        height: h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 30),
            HeadLineValue(
              text: 'gender',
              value: male ? 'male' : 'female',
            ),
            Row(
              children: [
                maleRadio(w),
                femaleRadio(w),
              ],
            ),
            HeadLineValue(
              text: 'Height in cm',
              value: '${heightSliderValue.round().toString()} cm',
            ),
            heightSlider(),
            HeadLineValue(
              text: 'Weight in kg',
              value: '${wightSliderValue.round().toString()} kg',
            ),
            weightSlider(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = wightSliderValue / pow((heightSliderValue / 100), 2);
                  cal = !cal;
                  Timer.periodic(Duration(seconds: 2), (timer) {
                    if (sumTimer > 5) {
                      timer.cancel();
                      setState(() {
                        sumTimer = 0;
                      });
                    }
                    setState(() {
                      cal = !cal;
                      sumTimer = sumTimer + 1;
                      print(sumTimer);

                    });
                  });
                });
              },
              child: Text('Cal'),
              style: ElevatedButton.styleFrom(primary: Colors.amber),
            ),
            SizedBox(height: 20),
            Expanded(
              child: animationBuild(w),
            )
          ],
        ),
      ),
    );
  }

  Stack animationBuild(double w) {
    return Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  top: cal ? 0 : 150,
                  bottom: !cal ? 0 : 200,
                  left: cal ? 0 : w * .5,
                  right: !cal ? 0 : w * .7,
                  child: AnimatedPadding(
                    duration: Duration(seconds: 1),
                    padding: cal ? EdgeInsets.all(0) : EdgeInsets.all(10),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: cal ? w * .9 : w * .5,
                      height: cal ? 150 : 50,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: cal
                              ? BorderRadius.circular(50.0)
                              : BorderRadius.circular(15.0)),
                      child: Center(child: Text(result.round().toString())),
                    ),
                  ),
                ),
              ],
            );
  }

  Padding weightSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Slider(
        value: wightSliderValue,
        onChanged: (value) {
          setState(() {
            wightSliderValue = value;
          });
        },
        min: 50,
        max: 350,
        divisions: 400,
        label: wightSliderValue.round().toString(),
      ),
    );
  }

  Padding heightSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Slider(
        value: heightSliderValue,
        onChanged: (value) {
          setState(() {
            heightSliderValue = value;
          });
        },
        min: 95,
        max: 225,
        divisions: 250,
        label: heightSliderValue.round().toString(),
      ),
    );
  }

  Container femaleRadio(double w) {
    return Container(
      width: w * .5 - 20,
      child: RadioListTile(

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.zero,
          title:
          Text('feMale', style: titleStyle),
          subtitle: Row(
            children: [
              Icon(Icons.female,color: Colors.white,size: 25,),
            ],
          ),
          value: false,
          groupValue: male,
          onChanged: (value) {
            setState(() {
              male = value as bool;
            });
          }),
    );
  }

  Container maleRadio(double w) {
    return Container(
      width: w * .5 - 20,
      child: RadioListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: EdgeInsets.zero,
          title: Text('Male', style: titleStyle),
          subtitle:Row(
            children: [
              Icon(Icons.male,color: Colors.white,size: 25,),
            ],
          ),
          value: true,
          groupValue: male,
          onChanged: (value) {
            setState(() {
              male = value as bool;
            });
          }),
    );
  }
}

class HeadLineValue extends StatelessWidget {
  final String value;
  final String text;

  const HeadLineValue({required this.value, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 25.0, color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 16.0, color: Colors.amber, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
