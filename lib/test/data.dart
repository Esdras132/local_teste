import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
   String _formattedDate = '';
  String _dayOfWeek = '';
  String _month = '';

  @override
  void initState() {
    super.initState();
    _updateDate();
  }

  void _updateDate() {
    DateTime now = DateTime.now();
    _formattedDate = DateFormat('dd/MM/yyyy').format(now);
    _dayOfWeek = DateFormat('EEEE', 'pt_BR').format(now);
    _month = DateFormat('MMMM', 'pt_BR').format(now);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Atual'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Data Completa: $_formattedDate',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Dia da Semana: $_dayOfWeek',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Mês: $_month',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateDate,
              child: Text('Atualizar Data'),
            ),
          ],
        ),
      ),
    );
  }
}
