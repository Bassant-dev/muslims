import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/appcolors.dart';
import '../view_model/sebha_cubit.dart';

class SebhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SebhaCubit, SebhaState>(

      listener: (context, state) {
        // TODO: implement listener
        if (state is SebhaIncrementSuccess ||
            state is SebhaResetCounterSuccess ||
            state is SebhaResetSumSuccess) {
          SebhaCubit.get(context).count;
          SebhaCubit.get(context).sum;
        }
        if (state is Sebhachangezekrcolor) {
          SebhaCubit.get(context).selectedzekrcolor;
        }
        if (state is SebhaResetSumSuccess) {
          SebhaCubit.get(context).zekrcounter;
        }
      },
      builder: (context, state) {
        if (SebhaCubit.get(context).selectedzekrindex == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            backgroundColor: AppColors.primarycolor,
            appBar: AppBar(
              backgroundColor: AppColors.mainColor,
              title: Text(
                "المسبحة الاكترونية",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${SebhaCubit.get(context).selectedzekr}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: Material(
                          child: GestureDetector(
                            //highlightColor: Colors.transparent,
                            child: SebhaContainer(
                                SebhaCubit.get(context).zekrcounter[
                                SebhaCubit.get(context)
                                    .selectedzekrindex!],
                                SebhaCubit.get(context).selectedzekrcolor!),
                            onTap: () {
                              SebhaCubit.get(context).Increment(
                                  SebhaCubit.get(context)
                                      .selectedzekrindex!);
                            },
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.transparent,
                        ),
                      ),
                      Text(
                        "المجموع: ${SebhaCubit.get(context).sum}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 500,
                        height: 100,
                        color: AppColors.primarycolor,
                        margin: EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          itemCount:
                          SebhaCubit.get(context).zekrcolor.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 35.0,
                                  backgroundColor: SebhaCubit.get(context)
                                      .zekrcolor[index],
                                ),
                              ),
                              onTap: () {
                                SebhaCubit.get(context)
                                    .displayzekrcolor(index);
                              },
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.mainColor,
                          child: Icon(
                            Icons.restore_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        SebhaCubit.get(context).Resetcounter(
                            SebhaCubit.get(context).selectedzekrindex!);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.mainColor,
                          child: Icon(
                            Icons.restart_alt_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        SebhaCubit.get(context)
                            .Resetsum(SebhaCubit.get(context).selectedzekrindex!);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );

  }
}

class SebhaContainer extends StatelessWidget {
  int? counter;
  Color? sebhacountercolor;
  SebhaContainer(int counter, Color sebhacountercolor) {
    this.counter = counter;
    this.sebhacountercolor = sebhacountercolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0,top: 15.0),
      child: CircleAvatar(
        backgroundColor: sebhacountercolor,
        radius: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$counter',
              style: TextStyle(fontSize: 40, color: Colors.white),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
