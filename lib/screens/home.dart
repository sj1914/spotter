import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spotter/utils/configuration.dart';
import 'package:spotter/entities/dog_breed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getImageURL(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String url = snapshot.data;
            return Scaffold(
              body: Container(
                  width: 500,
                  height: 500,
                  color: Colors.pinkAccent,
                  child: Image.network(url)),
            );
          } else {
            return Container();
          }
        });
  }

  Future<String> getImageURL() async {
    final FirebaseStorage storage =
        FirebaseStorage(storageBucket: Configuration.storageBucket);
    String imageURL = await getData();
    StorageReference ref = await storage.getReferenceFromUrl(imageURL);
    return await ref.getDownloadURL();
  }

  Future<String> getData() async {
    QuerySnapshot snapshot =
        await databaseReference.collection("dog_breeds").getDocuments();
    DogBreed dogBreed = DogBreed.fromJson(snapshot.documents[0].data);
    return dogBreed.imageURL;
  }
}
