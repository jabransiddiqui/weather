import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import '/presentation/presentation.dart';

class SearchField extends StatefulWidget {
  final void Function(String value) onChanged;
  final int delyTimeInMilliSecond;
  final String title;
  const SearchField({Key? key,required this.onChanged, required this.title, this.delyTimeInMilliSecond = 300}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late CancelableOperation<void> cancellableOperation;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(milliseconds: widget.delyTimeInMilliSecond)),
      onCancel: () {
        // print('Canceled');
      },
    );
  }

  void _onItemChanged(String? value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      onChanged: _onItemChanged,
      withLabel: true,
      hint: widget.title,
      
    );
  }
}
