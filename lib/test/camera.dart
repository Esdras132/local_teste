import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Image from Camera"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 300,
              child: controller == null
                  ? Center(child: Text("Loading Camera..."))
                  : !controller!.value.isInitialized
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      if (controller != null &&
                          controller!.value.isInitialized) {
                        image = await controller!.takePicture(); //capture image
                        setState(() {});
                      }
                    } catch (e) {
                      print(e); //show error
                    }
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Capture"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (image != null) {
                      // Share image
                      shareImage(image!.path);
                    }
                  },
                  icon: Icon(Icons.send),
                  label: Text("Send"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(30),
              child: image == null
                  ? Text("No image captured")
                  : Image.file(
                      File(image!.path),
                      height: 300,
                    ),
            ),
          ],
        ),
      ),
    );
  }



  void shareImage(String imagePath) {
    Share.shareFiles([imagePath], text: 'Check out this image!');
  }
}
