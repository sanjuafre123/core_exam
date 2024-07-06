import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Color barColor = const Color(0xff0174EB);
Color bgColor = const Color(0xff191A1F);

GlobalKey<FormState> formKey = GlobalKey();

TextEditingController txtName = TextEditingController();
TextEditingController txtGrid = TextEditingController();
TextEditingController txtStd = TextEditingController();

List studentList = [];

ImagePicker imgPicker = ImagePicker();
File? fileImage;