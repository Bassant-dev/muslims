import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslims/screens/names_of_allah/model/names_allah_model.dart';

class NamesOfAllahScreen extends StatelessWidget {
  const NamesOfAllahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//
      // backgroundColor: HexColor("#E4E4D0"),
      body: FutureBuilder<List<NamesAllahMODEL>>(
        future: readJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No data available.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => NamesAllahItem(item: items[index]),
            );
          }
        },
      ),
    );
  }

  Future<List<NamesAllahMODEL>> readJsonData() async {
    final jsonData = await rootBundle.loadString("json_file/Names_Of_Allah.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => NamesAllahMODEL.fromJson(e)).toList();
  }
}

class NamesAllahItem extends StatelessWidget {
  final NamesAllahMODEL item;

  const NamesAllahItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("#FEFBE9"),
      elevation: 3, // Add a shadow to the card
      margin: EdgeInsets.all(8), // Add some margin around the card
      child: ListTile(
        title: Text(
          item.name.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set text color to black
          ),
        ),
        onTap: () {
          _showMeaningDialog(context, item);
          print('Name pressed: ${item.name}');
        },
      ),
    );
  }
}

void _showMeaningDialog(BuildContext context, NamesAllahMODEL item) {
  print('Item tapped: ${item.name}');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: HexColor("#FEFBE9"),
        title: Text(
          'معنى ${item.name}',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          item.text.toString(),
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'إغلاق',
              style: TextStyle(
                color: HexColor("#6A9C89"), // Set the text color to #94A684
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
