import 'dart:io';

import 'package:extra_work1/homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Globle.dart';

class fileDetails extends StatefulWidget {
  const fileDetails({super.key});

  @override
  State<fileDetails> createState() => _fileDetailsState();
}

class _fileDetailsState extends State<fileDetails> {
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
          'Fill information',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        toolbarHeight: 55,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
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
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
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
                    child: const Icon(
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
                    child: const Icon(
                      Icons.image,
                      size: 38,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  controller: txtName,
                  decoration: InputDecoration(
                    label: const Text(
                      'Student name',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: txtGrid,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text(
                      'Grid ',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field must be required';
                    }
                  },
                  controller: txtStd,
                  decoration: InputDecoration(
                    label: const Text(
                      'Standard',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: (WidgetStatePropertyAll(Colors.blue)),
                ),
                onPressed: () {
                  if (fileImage != null) {
                    Navigator.of(context).pushNamed('/');
                    studentList.add(StudentModel(
                      name: txtName.text,
                      grid: txtGrid.text,
                      std: txtStd.text,
                      file: fileImage,
                    ));
                  }
                  if (fileImage == null) {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Photo must be required!')));
                    });
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
