import 'dart:async';
import 'package:test/test.dart' as unit;
import 'dart:typed_data';
Future<dynamic>main() async {
  ByteData data = new ByteData(1000);
  Uint8List uint8Buff = data.buffer.asUint8List();
  for(int i=0;i<1000;i++) {
    data.buffer.asUint8List()[i] = i;
  }

  unit.test("test1", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<1000;i++) {
      for (int i = 0; i < 1000; i++) {
        v += data.buffer.asUint8List(i)[0];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#1 ${end - start} ${v}");
  });
  unit.test("test2", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<1000;i++) {
      for (int i = 0; i < 1000; i++) {
        v += data.buffer.asUint8List()[i];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#2 ${end - start} ${v}");
  });

  unit.test("test3", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<1000;i++) {
      for (int i = 0; i < 1000; i++) {
        v += uint8Buff[i];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#3 ${end - start} ${v}");
  });
}