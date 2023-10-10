import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());
  static StoryCubit get(context)=>BlocProvider.of(context);
  double percentwatch=0;
  void startwatching()
  {
    emit(Storystartwatch());
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(percentwatch+0.01<1)
        {
          percentwatch+=0.01;
        }
      else
        {
          percentwatch= 1;
          timer.cancel();
          //emit(Storyfinish());
        }

    });
  }

  Future<File> shareImage(String imgPath) async {
    // Load the image bytes from the specified path
    final bytes = await rootBundle.load(imgPath);

    // Convert the loaded bytes to a list of integers
    final list = bytes.buffer.asUint8List();

    // Get the temporary directory path on the device
    final tempDir = await getTemporaryDirectory();

    // Create a new file in the temporary directory
    final file = await File('${tempDir.path}/sharedimage.jpg').create();

    // Write the image bytes to the newly created file
    file.writeAsBytesSync(list);
    // Return the created file
    return file;
  }





}
