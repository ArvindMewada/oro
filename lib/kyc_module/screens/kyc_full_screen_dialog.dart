import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:oro_sample/utils/network.dart';
import 'package:path_provider/path_provider.dart';

class KycFullScreenDialog extends StatefulWidget {
  final String language;
  final TextEditingController controller;

  const KycFullScreenDialog(
      {Key? key, required this.language, required this.controller})
      : super(key: key);

  @override
  _KycFullScreenDialogState createState() => _KycFullScreenDialogState();
}

class _KycFullScreenDialogState extends State<KycFullScreenDialog> {
  bool exists = true;

  bool pdfReady = false;
  bool loaded = false;



  @override
  void initState() {
    super.initState();
  }

  String language =
      "A wrapper around InheritedWidget to make them easier to use and more reusable."
      "By using provider instead of manually writing InheritedWidget, you get:"
      "simplified allocation/disposal of resources"
      "lazy-loading";

  String hindi =
      "InheritedWidget के चारों ओर एक आवरण जो उन्हें उपयोग में आसान और अधिक पुन: प्रयोज्य बनाता है।"
      "InheritedWidget को मैन्युअल रूप से लिखने के बजाय प्रदाता का उपयोग करके, आपको मिलता है:"
      "सरलीकृत आवंटन/संसाधनों का निपटान"
      "धीरे लोड हो रहा है";

  String tamil =
      "இன்ஹெரிட்டட் விட்ஜெட்டைச் சுற்றி ஒரு ரேப்பர் பயன்படுத்துவதை எளிதாக்கவும், மேலும் மீண்டும் பயன்படுத்தக்கூடியதாகவும் இருக்கும்."
      "InheritedWidget ஐ கைமுறையாக எழுதுவதற்குப் பதிலாக வழங்குநரைப் பயன்படுத்துவதன் மூலம், நீங்கள் பெறுவீர்கள்:"
      "எளிமைப்படுத்தப்பட்ட ஒதுக்கீடு/வளங்களை அகற்றுதல்"
      "சோம்பேறி-ஏற்றுதல்";

  String canada =
      "ಅವುಗಳನ್ನು ಬಳಸಲು ಸುಲಭವಾಗುವಂತೆ ಮತ್ತು ಹೆಚ್ಚು ಮರುಬಳಕೆ ಮಾಡುವಂತೆ ಮಾಡಲು InheritedWidget ಸುತ್ತಲೂ ಒಂದು ಹೊದಿಕೆ."
      "InheritedWidget ಅನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ಬರೆಯುವ ಬದಲು ಒದಗಿಸುವವರನ್ನು ಬಳಸುವ ಮೂಲಕ, ನೀವು ಪಡೆಯುತ್ತೀರಿ:"
      "ಸಂಪನ್ಮೂಲಗಳ ಸರಳೀಕೃತ ಹಂಚಿಕೆ/ವಿಲೇವಾರಿ"
      "ಸೋಮಾರಿತನ-ಲೋಡ್";

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      if (widget.controller.text == "Hindi") {
        setState(() {
          if (widget.controller.text != null) {
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        });
      } else if (widget.controller.text == "Tamil") {
         setState(() {
          if (widget.controller.text != null) {
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        });
      } else if (widget.controller.text == "Kannada") {
         setState(() {
          if (widget.controller.text != null) {
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        });
      } else if (widget.controller.text == "English") {
        setState(() {
          if (widget.controller.text != null) {
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        });
      }
    });

    if (loaded) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(),
        ),
      );
    } else {
      if (exists) {
        return const Scaffold(
          body: Center(
            child: Text(
              "Loading..",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      } else {
        //Replace Error UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Demo"),
          ),
          body: const Text(
            "PDF Not Available",
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    }
  }

  Widget body() {
    return widget.controller.text == "Hindi"
        ? Text(hindi)
        : widget.controller.text == "Tamil"
            ? Text(tamil)
            : widget.controller.text == "Kannada"
                ? Text(canada)
                : Text(language);
  }
}
