import 'dart:io';

import 'package:extra_work1/Utils/Globle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../homepage/HomePage.dart';

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: barColor,
        title: Text(
          'Edit Student Details',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        toolbarHeight: 55,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        (fileImage != null) ? FileImage(fileImage!) : null,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        fileImage = null;
                      });
                    },
                    child: const Text(
                      "Remove",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      XFile? xFileImage =
                          await imgPicker.pickImage(source: ImageSource.camera);
                      fileImage = File(xFileImage!.path);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.camera_alt,
                      size: 38,
                      color: Colors.white54,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      XFile? xFileImage = await imgPicker.pickImage(
                          source: ImageSource.gallery);
                      fileImage = File(xFileImage!.path);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.image,
                      size: 38,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  controller: txtName,
                  decoration: InputDecoration(
                    label: Text(
                      'Student name',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  controller: txtGrid,
                  decoration: InputDecoration(
                    label: Text(
                      'Grid ',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  controller: txtStd,
                  decoration: InputDecoration(
                    label: Text(
                      'Standard',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (fileImage != null) {
                    studentList[selectedindex].name = txtName.text;
                    studentList[selectedindex].grid = txtGrid.text;
                    studentList[selectedindex].std = txtStd.text;
                    Navigator.of(context).pushNamed('/');
                    // file: fileImage,
                  }
                  if (fileImage == null) {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Photo must be required!')));
                    });
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
