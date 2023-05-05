import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planetproject/controller/controller.dart';


class PlanetScreen extends StatefulWidget {
  const PlanetScreen({Key? key}) : super(key: key);

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> with SingleTickerProviderStateMixin{
  @override
  PlanetController get = Get.put(PlanetController());
  int j = Get.arguments;
  AnimationController? ani;
  @override
  void initState() {

    super.initState();
    ani = AnimationController(vsync: this,duration: Duration(seconds: 5));
    ani!.repeat();
    ani!.addListener(() {setState(() {});});
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3e3963),
        body: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60,left: 18,right: 15),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff434273),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 90,),
                        Text("${get.planetName[j]}",style: TextStyle(fontSize: 50,color: Colors.white),),
                        Text("Milkyway Galaxy",style: TextStyle(fontSize: 20,color: Colors.white54),),
                        Spacer(),
                        Row(
                          children: [
                            SizedBox(width: 30,),
                            Icon(Icons.location_on,color: Colors.white38,size: 20,),
                            SizedBox(width: 5,),
                            Text("${get.planetDistanceFromSun[j]}m km",style: TextStyle(color: Colors.white38,fontSize: 16),),
                            Spacer(),
                            Icon(Icons.arrow_downward_outlined,color: Colors.white38,size: 20,),
                            Text("${get.planetsAtmospherisPressure[j]}m/s2",style: TextStyle(color: Colors.white38,fontSize: 16),),
                            SizedBox(width: 9,),
                            SizedBox(width: 30,),
                          ],
                        ),
                        SizedBox(height:20,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 150,left: 200),
                    child: Transform.rotate(
                        angle: ani!.value*2*pi,
                        child: Image.asset("${get.planetPng[j]}",height: 120,width: 100,)),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("OVERVIEW",style: TextStyle(fontSize: 30,color: Colors.white),),
                  SizedBox(height: 10,),
                  Text("${get.planetInformation[j]}",style: TextStyle(fontSize: 15,color: Colors.white54),textAlign: TextAlign.justify),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Color(0xff434273),
                  context: context, builder: (context) {
                  return Column(
                    children: [
                      InkWell(
                        onTap:() {
                          Get.back();
                        },
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text("Welcome to ${get.planetName[j]}",style: TextStyle(fontSize: 30,color: Colors.white),),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Image.asset("${get.planetPng[j]}",height: 120,width: 120,),
                      SizedBox(height: 30,),
                      Text("Distance from Sun",style: TextStyle(fontSize: 15,color: Colors.white54),),
                      Text("${get.planetDistanceFromSun[j]} million km",style: TextStyle(fontSize: 30,color: Colors.white),),
                      SizedBox(height: 30,),
                      Text("Distance from Earth",style: TextStyle(fontSize: 15,color: Colors.white54),),
                      Text("${get.planetDistanceFromEarth[j]} ",style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  );
                },);
              },
              child: Container(
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      Get.back();
                    }, child: Row(
                      children: [
                        Icon(Icons.chevron_left_outlined,color: Colors.white,size: 30,),
                        Text("BACK",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    )),
                    SizedBox(width: 20,),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
