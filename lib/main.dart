
import 'dart:convert';
import 'dart:typed_data';
import 'package:cipher2/cipher2.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    cipherEncode();
  }

  Future<void> cipherEncode() async {
    // Dart code
   /* final method = 'AES-256-CBC';
    final salt = 'A4476C2062FFA58980DC8F79EB6A799E';
    final key = 'A4476C2062FFA58980DC8F79EB6A799E';

    final data = '10001984';

    // Converting Array to bytes
    final iv = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    final IVbytes = iv.map((byte) => byte.toRadixString(16)).join('');

    final pbkdf2 = PBKDF2KeyDerivator(HMac(SHA512Digest(), 64));
    pbkdf2.init(New.Pbkdf2Parameters(Uint8List.fromList(utf8.encode(salt)), 65536, 32));
    final hash = pbkdf2.process(Uint8List.fromList(utf8.encode(key)));

    final padding = PKCS7Padding();
    final encrypter = Encrypter(AES(pre.Key(hash), mode: AESMode.cbc,padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(data, iv: IV.fromUtf8(IVbytes));
    // MGNcskqzKqBw+ZFJLBP6dw==
    print('encrypted 3 : ${base64.encode(encrypted.bytes)}');*/


   /* final  ivtempo = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    final IVbytes = ivtempo.map((byte) => byte.toRadixString(16)).join('');
    const mykey = 'A4476C2062FFA58980DC8F79EB6A799E';
    var myiv = IVbytes;
    final keyUtf8 = utf8.encode(mykey);
    final ivUtf8 = utf8.encode(myiv);
    final key = sha256.convert(keyUtf8).toString().substring(0, 32);
    final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
    var _iv = IV.fromUtf8(iv);

    var _encrypter = Encrypter(AES(pre.Key.fromUtf8(key), mode: AESMode.cbc));
    final encrypted = _encrypter.encrypt('10001984', iv: _iv);
    // MGNcskqzKqBw+ZFJLBP6dw==
    print('encrypted 3 : ${base64.encode(encrypted.bytes)}');*/

    String plainText = '10001984';
    String key = 'A4476C2062FFA58980DC8F79EB6A799E';
    String iv = 'fNRJDLaHCK30bqbE';
    String nonce = await Cipher2.generateNonce();

   var  encryptedString = await Cipher2.decryptAesCbc128Padding7(plainText, key, nonce);
    print(encryptedString);
  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
