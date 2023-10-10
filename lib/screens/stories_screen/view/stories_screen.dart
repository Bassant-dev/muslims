import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslims/screens/stories_screen/view/story_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';


import '../../../core/SharedFunctions.dart';
import '../view_model/stories_cubit.dart';
import 'package:muslims/core/appcolors.dart';
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
        backgroundColor:AppColors.primaryColor,
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
            color: AppColors.primarycolor,
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
                      backgroundColor:storyItem.hasGreenBorder ? AppColors.fourthcolor : Colors.black26,
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: AppColors.primarycolor,
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
