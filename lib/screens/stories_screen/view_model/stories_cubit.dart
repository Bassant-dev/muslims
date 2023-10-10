import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';
part 'stories_state.dart';
class StoryItem {
   String imagePath;
   bool hasGreenBorder;

  StoryItem({
    required this.imagePath,
    required this.hasGreenBorder,
  });
}
class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(StoriesInitial());
  static StoriesCubit get(context)=>BlocProvider.of(context);

  List<StoryItem> assetPaths = [
    StoryItem(imagePath: 'assets/img/book2.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book3.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book4.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book5.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book6.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book7.jpg', hasGreenBorder: true),
    StoryItem(imagePath: 'assets/img/book8.jpg', hasGreenBorder: true),
    // Add more asset paths as needed
  ];
  List<StoryItem> randomstories=[];
  int? storyindex;
  String ? storypath;
  Color storycolor=Colors.green;
  void openstory(int i)
  {
    emit(StoryOpen());
    randomstories[i].hasGreenBorder=false;
    print("the story$i is opened so green borders is ${randomstories[i].hasGreenBorder}");
  }


  void getrandomlist()
  {
    emit(StoriesSuccess());
    randomstories = generaterandomlist(assetPaths);
    print("randomstories: $randomstories");
  }
  List<StoryItem> generaterandomlist(List<StoryItem> list) {
    if (list.length <= 5) {
      return List<StoryItem>.from(list);
    }

    List<int> indices = [];
    Random random = Random();
    List<StoryItem> randomList = [];

    while (indices.length < 5) {
      int randomIndex = random.nextInt(list.length);

      if (!indices.contains(randomIndex)) {
        indices.add(randomIndex);
        randomList.add(list[randomIndex]);
      }
    }

    return randomList;
  }

}
