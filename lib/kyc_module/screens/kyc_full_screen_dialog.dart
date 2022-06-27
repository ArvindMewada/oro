import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
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
  String urlPDFPath = "";
  bool exists = true;
  final int _totalPages = 0;
  int _currentPage = 0;

  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;

  String englishUrl = "http://www.africau.edu/images/default/sample.pdf";

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  void initState() {
    
    getFileFromUrl(englishUrl, name: "Engslish").then(
          (value) => {
            setState(() {
              if (value.path.isNotEmpty) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                exists = false;
              }
            })
          },
        );

   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     widget.controller.addListener(() {
      if (widget.controller.text == "Hindi") {
        getFileFromUrl(
                "https://freehomedelivery.net/wp-content/uploads/2018/07/3-2_Hindi-SET-2.pdf",
                name: "Hindi")
            .then(
          (value) => {
            setState(() {
              if (value.path.isNotEmpty) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                exists = false;
              }
            })
          },
        );
      } else if (widget.controller.text == "Tamil") {
        getFileFromUrl(
                "http://wbbse.org/Files/TAMIL_SAMPLE_QUESTION_2011_I.pdf",
                name: "Tamil")
            .then(
          (value) => {
            setState(() {
              if (value.path.isNotEmpty) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                exists = false;
              }
            })
          },
        );
      } else if (widget.controller.text == "Kannada") {
        getFileFromUrl(
                "https://atimysore.gov.in/wp-content/uploads/h-b-of-executive-magistrates.pdf",
                name: "Kannada")
            .then(
          (value) => {
            setState(() {
              if (value.path.isNotEmpty) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                exists = false;
              }
            })
          },
        );
      } 
    });
    
    if (loaded) {
      return Scaffold(
        body: body(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chevron_left),
              iconSize: 24,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage > 0) {
                    _currentPage--;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
            Text(
              '$_currentPage',
              key: const Key('counterState'),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              iconSize: 24,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage < _totalPages - 1) {
                    _currentPage++;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
          ],
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
    return PDFView(
      filePath: urlPDFPath,
      autoSpacing: false,
      enableSwipe: true,
      pageSnap: true,
      swipeHorizontal: true,
      nightMode: false,
      onError: (e) {},
      onRender: (_pages) {
        setState(() {
          pdfReady = true;
        });
      },
      onViewCreated: (PDFViewController vc) {
        setState(() {
          _pdfViewController = vc;
        });
      },
      onPageChanged: (page, _) {
        setState(() {});
      },
      onPageError: (page, e) {},
    );
  }
}
