// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'item_list.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('shopping_list');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: key,
          child: Column(
            children: [
              /////////////////////////////////////////////////////

              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),

              /////////////////////////////////////////////////////

              TextFormField(
                controller: _controllerQuantity,
                decoration: const InputDecoration(
                    hintText: 'Enter the quantity of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item quantity';
                  }

                  return null;
                },
              ),

              /////////////////////////////////////////////////////

              IconButton(
                onPressed: () async {
                  /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                  /*Step 1:Pick image*/
                  //Install image_picker
                  //Import the corresponding library

                  final imagePicker = ImagePicker();
                  final file =
                      await imagePicker.pickImage(source: ImageSource.camera);

                  if (file == null) {
                    return;
                  }
                  //Import dart:core

                  /*Step 2: Upload to Firebase storage*/
                  //Install firebase_storage
                  //Import the library

                  //Get a reference to storage root
                  final referenceRoot = FirebaseStorage.instance.ref();
                  final referenceDirImages = referenceRoot.child('images');

                  //Create a reference for the image to be stored
                  final referenceImageToUpload =
                      referenceDirImages.child('name');

                  //Handle errors/success
                  try {
                    //Store the file
                    await referenceImageToUpload.putFile(File(file.path));
                    //Success: get the download URL
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {
                    //Some error occurred
                  }
                },
                icon: const Icon(Icons.camera_alt),
              ),

              /////////////////////////////////////////////////////

              ElevatedButton(
                onPressed: () async {
                  if (imageUrl.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please upload an image'),
                      ),
                    );

                    return;
                  }

                  if (key.currentState!.validate()) {
                    final itemName = _controllerName.text;
                    final itemQuantity = _controllerQuantity.text;

                    //Create a Map of data
                    final dataToSend = <String, String>{
                      'name': itemName,
                      'quantity': itemQuantity,
                      'image': imageUrl,
                    };

                    //Add a new item
                    await _reference.add(dataToSend);
                  }
                },
                child: const Text('保存'),
              ),

              /////////////////////////////////////////////////////

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemList(),
                    ),
                  );
                },
                child: const Text('ListPage'),
              )

              /////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
