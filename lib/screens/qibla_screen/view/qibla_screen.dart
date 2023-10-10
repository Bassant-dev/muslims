import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class qiblaScreen extends StatelessWidget {
  const qiblaScreen({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return SmoothCompass(
      height: double.infinity,
      width: double.infinity,
      isQiblahCompass: true,
      compassBuilder: (context,snapshot,child){
        return  AnimatedRotation(
          duration: const Duration(milliseconds:800),
          turns: snapshot?.data?.turns??0,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child:Image.asset("assets/img/qibla2.png"),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child:AnimatedRotation(
                    duration: const Duration(milliseconds: 500),
                    turns: (snapshot?.data?.qiblahOffset??0)/360,
                    //Place your qiblah needle here
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,),
                      child: const VerticalDivider(
                        color: Colors.grey,
                        thickness: 5,),
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
