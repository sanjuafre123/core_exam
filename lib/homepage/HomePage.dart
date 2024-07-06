import 'dart:io';

import 'package:extra_work1/Utils/Globle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: barColor,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
        child: Column(
          children: [
            ...List.generate(
              studentList.length,
              (index) => Container(
                height: 100,
                padding: EdgeInsets.only(left: 6),
                margin: EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff35383F),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: (studentList[index].file != null)
                          ? FileImage(studentList[index].file!)
                          : null,
                    ),
                    SizedBox(
                      width: 210,
                      child: GestureDetector(
                        onTap: () {
                          txtName.text = studentList[index].name;
                          txtStd.text = studentList[index].std;
                          txtGrid.text = studentList[index].grid;
                          fileImage = studentList[index].file;
                          Navigator.of(context).pushNamed('/show');
                        },
                        child: ListTile(
                          title: Text(
                            studentList[index].name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          subtitle: Text(
                            studentList[index].grid,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          leading: Text(
                            studentList[index].std,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            txtName.text = studentList[index].name;
                            txtGrid.text = studentList[index].grid;
                            txtStd.text = studentList[index].std;
                            fileImage = studentList[index].file;
                            selectedindex = index;
                            Navigator.of(context).pushNamed('/edit');
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              studentList.removeAt(index);
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txtName = TextEditingController();
          txtStd = TextEditingController();
          txtGrid = TextEditingController();
          fileImage = null;
          Navigator.of(context).pushNamed('/file');
        },
        backgroundColor: barColor,
        child: const Icon(
          Icons.add,
          size: 33,
          color: Colors.white,
        ),
      ),
    );
  }
}

int selectedindex = 0;

class StudentModel {
  String? name, grid, std;
  File? file;

  StudentModel({this.std, this.name, this.grid, this.file});
}
