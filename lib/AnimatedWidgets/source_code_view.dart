import 'package:flutter/material.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class MySourceCodeView extends StatelessWidget {
  final String _filePath;

  MySourceCodeView(this._filePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SourceCodeView(filePath: 'lib/AnimatedWidgets/$_filePath')),
      appBar: AppBar(
        title: Text("Source Code"),
      ),
    );
  }
}
