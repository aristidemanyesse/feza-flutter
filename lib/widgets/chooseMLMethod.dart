import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'camera_view.dart';
import 'painters.dart';

class ChooseMLMethod extends StatefulWidget {
  static const routeName = "/test";

  @override
  State<ChooseMLMethod> createState() => _ChooseMLMethodState();
}

class _ChooseMLMethodState extends State<ChooseMLMethod> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(recognizedText,
          inputImage.metadata!.size, inputImage.metadata!.rotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 600,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.9)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "😩😟 Hhmmm !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                    CameraView(
                      title: 'Text Detector',
                      customPaint: _customPaint,
                      text: _text,
                      onImage: (inputImage) {
                        processImage(inputImage);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        "Voulez-vous vraiment quitter cettte application ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, height: 1.5, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Oui",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Non, Annuler",
                            style: TextStyle(fontSize: 17),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
