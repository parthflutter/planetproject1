import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planetproject/controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  PlanetController get = Get.put(PlanetController());
  AnimationController? ani;
  Animation? planetRotation;
  @override
  void initState() {
    super.initState();
    ani = AnimationController(vsync: this,duration: Duration(seconds: 4));
    planetRotation = Tween<double>(begin: 10,end: 10).animate(ani!);
    ani!.repeat(reverse: false);
    ani!.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3e3963),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10)
              )
          ),
          title: Text("GALAXY PLANETS"),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 30,),
          ],
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return  Container(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'PlanetScreen',arguments: index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 80,top: 20,bottom: 20,right: 20),
                    height: 150,
                    width: 500,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text("${get.planetName[index]}",style: TextStyle(fontSize: 30,color: Colors.white,),textAlign: TextAlign.left,),
                                      Spacer(),
                                      Icon(Icons.more_vert_outlined,color: Colors.white30,size: 20,)
                                    ],
                                  ),
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text("Milkyway Galaxey",style: TextStyle(fontSize: 15,color: Colors.white54,),textAlign: TextAlign.left,)),
                              Divider(color: Colors.blue,thickness: 2,endIndent: 150,),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.white38,size: 18,),
                                  Text("${get.planetDistanceFromSun[index]}m km",style: TextStyle(color: Colors.white38,fontSize: 12),),
                                  Spacer(),
                                  Icon(Icons.arrow_downward_outlined,color: Colors.white38,size: 18,),
                                  Text("${get.planetsAtmospherisPressure[index]}m/s2",style: TextStyle(color: Colors.white38,fontSize: 12),),
                                  SizedBox(width: 1,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff434273),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12,blurRadius: 10,spreadRadius: 5)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 10),
                  child: Transform.rotate(
                    angle: ani!.value*2*pi,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset("${get.planetPng[index]}",height: 105,width: 105,),
                    ),
                  ),
                )
              ],
            ),
          );
        },itemCount: get.planetPng.length,),
      ),
    );
  }
}

