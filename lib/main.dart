import 'package:flutter/material.dart';
import 'package:flutter_uyg1/testVeri.dart';
import 'const.dart';
import 'soru.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test1 = new TestVeri();
  void butonFonksiyonu(bool secilenButon) {
    if (test1.testBittimi() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Bravo Testi Bitirdiniz'),
              //content: new Text('Alert Dialog Body'),
              actions: [
                new ElevatedButton(
                  child: new Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    setState(() {
                      test1.testSifirla();
                      secimler = [];
                    });
                  },
                )
              ],
            );
          });
    } else {
      bool dogruYanit = test1.getSoruYaniti();
      setState(
        () {
          if (dogruYanit == secilenButon) {
            secimler.add(kDogruIconu);
          } else {
            secimler.add(kYanlisIconu);
          }
          test1.sonrakiSoru();
        },
      );
    }
  }

  Soru s1 = Soru(soruMetni: 'Soruu 1', soruYaniti: false); // Soru 1 tanımlaması
  Soru s2 = Soru(soruMetni: 'Soruu 2', soruYaniti: true);
  Soru s3 = Soru(soruMetni: 'Soruu 3', soruYaniti: false);
  Soru s4 = Soru(soruMetni: 'Soruu 4', soruYaniti: false);
  Soru s5 = Soru(soruMetni: 'Soruu 5', soruYaniti: true);
  Soru s6 = Soru(soruMetni: 'Soruu 6', soruYaniti: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.end,
          runSpacing: 6,
          spacing: 6,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red[400], onPrimary: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.thumb_down, size: 30.0),
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green[300], onPrimary: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.thumb_up, size: 30.0),
                      ),
                      onPressed: () {
                        // anonim fonksiyon
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
