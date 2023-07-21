import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Result extends StatelessWidget {
  File? image;
  Result(this.image);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? Image.file(
              image!,
              width: 100,
              height: 100,
              // fit: BoxFit.none,
            )
                : CircleAvatar(
              child: Image.asset(
                "assets/images/folder.png",
                width: 100,
                height: 100,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      width: 300,
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('camera')),
              TextButton(onPressed: () {}, child: Text('gallery'))
            ],
          )
        ],
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/images/flower.jpg'),
          ),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => bottomSheet(),
                  );
                },
                child: Icon(
                  Icons.camera,
                  color: Colors.teal,
                  size: 28,
                ),
              ))
        ],
      ),
    );
  }

  Widget imageProfile2(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                // color: Colors.red,
                child: Hero(
                  tag: 0,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/flower.jpg'),
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ), //Container
              Positioned(
                top: 150,
                left: 340,
                child: Container(
                  width: 40,
                  height: 40,
                  // color: Colors.black,
                  child: MaterialButton(
                    onPressed: () {
                      print('object');
                    },
                    color: Colors.black54,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    shape: CircleBorder(),
                  ),
                ),
              ), //Container
              Positioned(
                left: 10,
                top: 150,
                child: Container(
                  height: 80,
                  width: 80,
                  // color: Colors.purple,
                  child: ImageHolderLayout(),
                ),
              ), //Container
            ], //<Widget>[]
          ), //Stack
        ), //Center
      ), //SizedBox
    ); //
  }
}

class ImagePlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/placeholder.png',
                ),
              ),
              shape: BoxShape.rectangle,
            ),
            alignment: Alignment.center,
            height: 80,
            // child: image != null
            //     ? Image.file(
            //   image!,
            //   width: 360,
            //   height: 260,
            //   // fit: BoxFit.none,
            // )
            //     : FlutterLogo(size: 160)
          ),
        ],
      ),
    );
  }
}

class ImageHolderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: Alignment.center,
                  height: 80,
                  child: null), //Container
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                // bottom: 30,
                child: Container(
                  // width: 20,
                  // height: 20,
                  // color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 40),
                    child: IconButton(
                      onPressed: () {
                        print('object');
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30.0,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                ),
              ), //Container
              //Container
            ], //<Widget>[]
          ), //Stack
        ), //Center
      ), //SizedBox
    );
  }
}
