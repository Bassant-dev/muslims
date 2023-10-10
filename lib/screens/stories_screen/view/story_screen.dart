import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslims/screens/stories_screen/view/progress_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/SharedFunctions.dart';
import '../../../core/appcolors.dart';

class StoryScreen extends StatelessWidget {
  String? img;
  double progress = 0.0;
  late Timer timer;
  BuildContext? parentContext;
  StoryScreen(String img,BuildContext context)
  {
    this.img=img;
    this.parentContext=context;
    // Start the timer when the screen is created
    timer = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      if (progress <= 0.99) {
        // Increase the progress until it reaches 1.0
        progress += 0.01;
      } else {
        // Cancel the timer when progress reaches 1
        progress=1.0;
        t.cancel();
        navback(parentContext!);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // Navigate back to StoriesScreen after a delays


    return Scaffold(
      backgroundColor: Colors.black,
      body: InkWell(
        child: Stack(
            children:[
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:Image(
                      image: AssetImage(img!),
                      fit: BoxFit.contain,
                    )
                ),
              ),
              Positioned(
                bottom: 1,
                left: 1,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primarycolor,
                      child: Icon(
                        Icons.share,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onTap: () async {
                    //share image with social media
                    final bytes = await rootBundle.load(img!);
                    final list = bytes.buffer.asUint8List();

                    final tempDir = await getTemporaryDirectory();
                    final file = await File('${tempDir.path}/sharedimage.jpg').create();
                    file.writeAsBytesSync(list);
                    Share.shareFiles(['${file.path}'], text: 'Great picture');
                  },
                ),
              ),

              StreamBuilder<double>(
                initialData: progress,
                stream: Stream.periodic(Duration(milliseconds: 50), (_) => progress),
                builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: MyProgressBar(
                      PercentWatched: snapshot.data!,
                    ),
                  );
                },
              )
            ]
        ),
        onTap: ()
        {
          //If tapped a long tap stay
          navback(context);
        },
      ),
    );
  }
}

