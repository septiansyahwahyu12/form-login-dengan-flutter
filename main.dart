import 'package:flutter/material.dart';

import 'beranda.dart';

class ColorPallete {
  static const PrymaryColor = Color(0xfffce4ec);
  static const PrymaryDarkColor = Color(0xffff80ab);
  static const UnderlineTextField = Color(0xfff44336);
  static const HintColor = Color(0xffff9800);


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'My Login';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final String nama = "wahyu", sandi = "kamparmaju";
  final namaController = TextEditingController();
  final sandiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //yang ini untuk nama
          TextFormField(
            controller: namaController,
            decoration:
                InputDecoration(hintText: 'Masukkan Nama Pengguna yang benar'),
            validator: (value) {
              if (value.isEmpty) {
                return 'User Anda Valid, Masukkan User Anda Yang Benar';
              }
              return null;
            },
          ),
          //Yang ini untuk sandi
          TextFormField(
            controller: sandiController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Masukkan Sandi yang benar"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Sandi Anda Salah, Masukkan Sandi Anda Yang Benar ';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (namaController.text.trim() == nama &&
                    sandiController.text.trim() == sandi) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Maaf Nama Pengguna Atau Sandi Tidak Tersedia atau Valid'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
}
