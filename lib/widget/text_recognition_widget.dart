import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:firebase_ml_text_recognition/api/firebase_ml_api.dart';
import 'package:firebase_ml_text_recognition/widget/text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'controls_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File image;

  @override
  Widget build(BuildContext context) => Expanded(

        child: Column(
          children: [
            Expanded(child: buildImage()),
            const SizedBox(height: 16),
            ControlsWidget(
              onClickedPickImage: pickImage,
              onClickedCamera: cameraImage,//
              onClickedScanText: scanText,
              onClickedClear: clear,
            ),
            const SizedBox(height: 16),
            TextAreaWidget(
              text: text,
              //onClickedCopy: copyToClipboard,
            ),
          ],
        ),
      );

  Widget buildImage() => Container(
        child: image != null
            ? Image.file(image)
            : Icon(Icons.photo, size: 50, color: Colors.blueGrey),
      );

  Future pickImage() async {
    /* ***********************
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('AGBs & Datenschutzerklärung'),
          content: Text("Wenn Sie auf Weiter anklicken, stimmen Sie den Nutzungsbedingungen und der Datenschutzrichtlinie in Bezug auf die Verwendung Ihrer Daten zu."),
          actions: [TextButton(onPressed: ()=> Navigator.pop(context), child: Text('Weiter'))],
        ));
    ***************************/

    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    setImage(File(file.path));
  }
  //****************************
  Future cameraImage() async {
  /*  showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('AGBs & Datenschutzerklärung'),
          content: Text("Wenn Sie auf Weiter anklicken, stimmen Sie den Nutzungsbedingungen und der Datenschutzrichtlinie in Bezug auf die Verwendung Ihrer Daten zu."),
          actions: [TextButton(onPressed: ()=> Navigator.pop(context), child: Text('Weiter'))],
        ));*/

    final file = await ImagePicker().getImage(source: ImageSource.camera);
    setImage(File(file.path));
  }
//*********************************

  Future scanText() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('AGBs & Datenschutzerklärung'),
          content: Text("Wenn Sie auf Weiter anklicken, stimmen Sie den Nutzungsbedingungen und der Datenschutzrichtlinie in Bezug auf die Verwendung Ihrer Daten zu."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Weiter"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
    showDialog(
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ), context: context,
    );

    final text = await FirebaseMLApi.recogniseText(image);
    setText(text);

    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }

}

