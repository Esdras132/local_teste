import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CalendarioText extends StatefulWidget {
  @override
  _CalendarioTextState createState() => _CalendarioTextState();
}

class _CalendarioTextState extends State<CalendarioText> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Form Field Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select Date',
            suffixIcon: Icon(Icons.calendar_today),
          ),
          onTap: () => _selectDate(context),
        ),
        TextButton(onPressed: (){
          log(_dateController.text);
        }, child: const Text('sduof'))
          ],
        )
      ),
    );
  }
}
