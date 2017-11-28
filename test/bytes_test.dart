import 'dart:async';
import 'package:test/test.dart' as unit;
import 'dart:typed_data';
Future<dynamic>main() async {
  ByteData data = new ByteData(1000);
  Uint8List uint8Buff = data.buffer.asUint8List();
  int s = 1000;
  int l = 5*10000;
  for(int i=0;i<s;i++) {
    data.buffer.asUint8List()[i] = i;
  }

  unit.test("test1", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.buffer.asUint8List(i%s)[0];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#1 ${end - start} ${v}");
  });

  unit.test("test2", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.buffer.asUint8List()[i%s];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#2 ${end - start} ${v}");
  });

  unit.test("test3", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.getUint8(i%s);
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#3 ${end - start} ${v}");
  });

  unit.test("test4", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += uint8Buff[i%s];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#4 ${end - start} ${v}");
  });
}