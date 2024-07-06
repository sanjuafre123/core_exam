import 'package:extra_work1/Utils/Globle.dart';
import 'package:flutter/material.dart';

class ShoeData extends StatefulWidget {
  const ShoeData({super.key});

  @override
  State<ShoeData> createState() => _ShoeDataState();
}

class _ShoeDataState extends State<ShoeData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: barColor,
        title: const Text(
          'Students Details',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        toolbarHeight: 65,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: (fileImage != null) ? FileImage(fileImage!) : null,
                ),

              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Text('  Student Name :  ${txtName.text}',style: TextStyle(color: Colors.white,fontSize: 20),),
              const SizedBox(height: 20),
              Text('Student GRID :  ${txtGrid.text}',style: TextStyle(color: Colors.white,fontSize: 20),),
              const SizedBox(height: 20),
              Text('  Student Standard :  ${txtStd.text}',style: TextStyle(color: Colors.white,fontSize: 20),),
            ],
          )
        ],
      ),
    );
  }
}
