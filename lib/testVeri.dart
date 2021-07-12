import 'soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _soruBankasi = [
    Soru(soruMetni: 'Soruu 1', soruYaniti: false),
    Soru(soruMetni: 'Soruu 2', soruYaniti: true),
    Soru(soruMetni: 'Soruu 3', soruYaniti: false),
    Soru(soruMetni: 'Soruu 4', soruYaniti: false),
    Soru(soruMetni: 'Soruu 5', soruYaniti: true),
    Soru(soruMetni: 'Soruu 6', soruYaniti: true)
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool testBittimi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testSifirla() {
    _soruIndex = 0;
  }
}
