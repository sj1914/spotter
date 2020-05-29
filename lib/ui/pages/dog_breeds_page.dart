import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogBreedsPage extends StatelessWidget {
  final String text;

  DogBreedsPage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Breeds"),
      ),
      body: Center(
        child: Text('My text is: $text'),
      ),
    );
  }

// TODO Need to move all this in to a bloc/repository? for this page.
//  final databaseReference = Firestore.instance;
//  Future<String> getImageURL() async {
//    final FirebaseStorage storage =
//    FirebaseStorage(storageBucket: Configuration.storageBucket);
//    String imageURL = await getData();
//    StorageReference ref = await storage.getReferenceFromUrl(imageURL);
//    return await ref.getDownloadURL();
//  }
//
//  Future<String> getData() async {
//    QuerySnapshot snapshot =
//    await databaseReference.collection("dog_breeds").getDocuments();
//    DogBreed dogBreed = DogBreed.fromJson(snapshot.documents[0].data);
//    return dogBreed.imageURL;
//  }

//    return FutureBuilder<String>(
//        future: getImageURL(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            final String url = snapshot.data;
//            return Scaffold(
//              body: Container(
//                  width: 500,
//                  height: 500,
//                  color: Colors.pinkAccent,
//                  child: Image.network(url)),
//            );
//          } else {
//            return Container();
//          }
//        });
//  }
}