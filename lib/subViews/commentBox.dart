import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CmmtBox extends StatefulWidget {
  @override
  _CmmtBoxState createState() => _CmmtBoxState();
}

class _CmmtBoxState extends State<CmmtBox> {
  File? _image;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();


  //메모리 해제
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://chuksokwuenu.com/img/pic.jpg',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic':
      'https://event.chuksokwuenu.com/images/IMG_20200522_122853_521~2.jpg',
      'message': 'Very cool'
    },
    {
      'name': 'Tunde Martins',
      'pic':
      'https://lh3.googleusercontent.com/gXjdVvgHcgJphBYJ_yxPyQF7gf2k4Ze4wYUj7lA9ObWYIUNBeD16H3RF6ylEGrjpbmBNVlcuSSkMa3NN=w768-h768-n-o-v1',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: CommentBox(
          userImage:
          "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: Container(
              child: _image ==null? Text('No Image') : Image.file(_image!),
          ),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          commentController: commentController,
          sendButtonMethod: () {
            final firebaseStorageRef = FirebaseStorage.instance
                .ref()
                .child('post')
                .child('${DateTime.now().millisecondsSinceEpoch}.png');


            final task = firebaseStorageRef.putFile(
                _image!, SettableMetadata(contentType: 'image/png')
            );

            task.then((TaskSnapshot snapshot){
              var downloadUrl=snapshot.ref.getDownloadURL();

              downloadUrl.then((uri){
                //post라는 컬렉션을 만들겠다라는 뜻
                var doc = FirebaseFirestore.instance.collection('post').doc();
                //Map형식
                doc.set({
                  'id': doc.id,
                  'photoUrl': uri.toString(),
                  'contents': commentController.text,
                });
              });
            }).then((value) => Navigator.pop(context));


   /*           setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });*/
           /*   commentController.clear();*/
              FocusScope.of(context).unfocus();
          },

          backgroundColor: Colors.white,
          textColor: Colors.black,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future _getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }
}