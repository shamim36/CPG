import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfDisplayPage extends StatelessWidget {
  final List<int> pdfBytes;

  const PdfDisplayPage({super.key, required this.pdfBytes});

  @override
  Widget build(BuildContext context) {
    Uint8List uint8List = Uint8List.fromList(pdfBytes);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cover Page'),
      ),
      body: SfPdfViewer.memory(
        uint8List,
        controller: PdfViewerController(),
      ),
    );
  }
}
