import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  TextEditingController _controller = TextEditingController();
  String _savedValue = '';

  @override
  void initState() {
    super.initState();
    _loadSavedValue();
  }

  // Carrega o valor salvo do SharedPreferences
  Future<void> _loadSavedValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedValue = prefs.getString('saved_value') ?? '';
    });
  }

  // Salva o valor no SharedPreferences
  Future<void> _saveValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('saved_value', _controller.text);
    setState(() {
      _savedValue = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter value to save'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveValue,
              child: Text('Save Value'),
            ),
            SizedBox(height: 20),
            Text('Saved value: $_savedValue'),
          ],
        ),
      ),
    );
  }
}
