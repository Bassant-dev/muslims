import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:week4/core/SharedFunctions.dart';
import 'package:week4/core/appcolors.dart';
import 'package:week4/screens/stories_screen/view/progress_bar.dart';
import 'package:week4/screens/stories_screen/view/story_screen.dart';
import 'package:week4/screens/stories_screen/view_model/stories_cubit.dart';

class StoriesScreen extends StatelessWidget {
  StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home",
        style: TextStyle(
            color: Colors.black
        ),
        ),
        backgroundColor: mainColor,
      ),
      body: BlocConsumer<StoriesCubit, StoriesState>(
        listener: (context, state) {
          if (state is StoryOpen && StoriesCubit.get(context).randomstories.isNotEmpty) {
            // Perform navigation to StoryScreen
            print("dakhaltttt");
            print("the img index in cubit: ${StoriesCubit.get(context).storyindex!}");
            print("the img index in randlist: ${ StoriesCubit.get(context).randomstories[StoriesCubit.get(context).storyindex!].imagePath}");
           print("the img path to story: ${StoriesCubit.get(context).storypath}");
            navto(context, StoryScreen(
                StoriesCubit.get(context).randomstories[StoriesCubit.get(context).storyindex!].imagePath,
              context
            ));
            print("success");
          }
        },
        builder: (context, state) {
          var storiescubit = StoriesCubit.get(context);
          return Container(
            color: primarycolor,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storiescubit.randomstories.length,
              itemBuilder: (BuildContext context, int index) {
                final storyItem = storiescubit.randomstories[index];
                StoriesCubit.get(context).storypath=storyItem.imagePath;
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor:storyItem.hasGreenBorder ? fourthcolor : Colors.black26,
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: primarycolor,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage(storyItem.imagePath),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    storiescubit.openstory(index);
                    StoriesCubit.get(context).storyindex = index;
                    print("story index${storiescubit.storyindex}");
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
