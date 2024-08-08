import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';




class PdfOnline extends StatefulWidget {
  final String link;
  const PdfOnline({required this.link});

  @override
  _PdfOnline createState() => _PdfOnline();
}

class _PdfOnline extends State<PdfOnline> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer ONLINE'),
        /* actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ], */
      ),
      body: SfPdfViewer.network(
        '${widget.link}',
        key: _pdfViewerKey,
      ),
    );
  }
}