import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageUploads extends StatefulWidget {
  ImageUploads({Key? key}) : super(key: key);

  @override
  _ImageUploadsState createState() => _ImageUploadsState();
}

class _ImageUploadsState extends State<ImageUploads> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  bool image_pick = true;

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future cropImage(filePath) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ));

    setState(() {
      imageFile = croppedFile;
    });
    if (imageFile != null) {
      image_pick = false;
    }
    print(imageFile);
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Mr.';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(5, 15),
                      )
                    ],
                  ),
                  child: ClipOval(
                    child: _photo != null
                        ? Image.file(
                            _photo!,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://freesvg.org/img/abstract-user-flat-4.png',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.deepPurple,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        _showPicker(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30 ,),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Container(
                    height: 60,
                    width: 90,
                    child: DropdownButtonFormField<String>(
                      value: dropdownValue,
                      items: <String>['Mr.','Mrs.','Miss.','Late.'].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                      }).toList(),
      elevation: 16,
      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      
                    ),

      
      onChanged: (String? newValue) {
        setState(() {
            dropdownValue = newValue!;
            print(newValue);
        });
      }
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.55,
                  child: TextFormField(
                    
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Middle Name',
                      ),
                    ),
                  ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      ),
                    ),
                  ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone No',
                      ),
                    ),
                  ),
          ),
                

        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
