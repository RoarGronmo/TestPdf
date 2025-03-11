import 'dart:html';
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFIFrameView(
          pdfUrl: 'https://www.orimi.com/pdf-test.pdf'), // Replace with your test PDF URL
    );
  }
}

class PDFIFrameView extends StatefulWidget {
  final String pdfUrl;

  const PDFIFrameView({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PDFIFrameViewState createState() => _PDFIFrameViewState();
}

class _PDFIFrameViewState extends State<PDFIFrameView> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    // Create the iframe
    _iFrameElement.height = '600';
    _iFrameElement.width = '800';
    _iFrameElement.src = widget.pdfUrl;
    _iFrameElement.style.border = 'none';

    // Register the view factory
    ui.platformViewRegistry.registerViewFactory(
      'pdf-iframe',
          (int viewId) => _iFrameElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF View with IFrame'),
      ),
      body: Center(
        child: SizedBox(
          width: 800,
          height: 600,
          child: HtmlElementView(
            viewType: 'pdf-iframe',
          ),
        ),
      ),
    );
  }
}