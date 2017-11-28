import 'dart:async';
import 'package:test/test.dart' as unit;
import 'dart:typed_data';
Future<dynamic>main() async {
  ByteData data = new ByteData(1000);
  Uint8List uint8Buff = data.buffer.asUint8List();
  int s = 1000;
  int l = 1000;
  for(int i=0;i<s;i++) {
    data.buffer.asUint8List()[i] = i;
  }

  unit.test("bytes: asUint8List offset", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.buffer.asUint8List(i%s)[0];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: asUint8List# ${end - start} ${v}");
  });

  unit.test("bytes: asUint8List", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.buffer.asUint8List()[i%s];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: asUint8List# ${end - start} ${v}");
  });

  unit.test("bytes: getUint8", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += data.getUint8(i%s);
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: getUint8# ${end - start} ${v}");
  });

  unit.test("bytes: Uint8List", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v += uint8Buff[i%s];
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: Uint8List# ${end - start} ${v}");
  });

  unit.test("bytes: data.getUint64", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        v = data.getUint64(i%(s-8));
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: data.getUint64# ${end - start} ${v}");
  });

  unit.test("bytes: manually uint8list", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    int ret =0;
    int j=0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        ret = 0;
        j = i%(s-8);
        ret = ret | ((uint8Buff[0 + j] & 0xff) << 56);
        ret = ret | ((uint8Buff[1 + j] & 0xff) << 48);
        ret = ret | ((uint8Buff[2 + j] & 0xff) << 40);
        ret = ret | ((uint8Buff[3 + j] & 0xff) << 32);
        ret = ret | ((uint8Buff[4 + j] & 0xff) << 24);
        ret = ret | ((uint8Buff[5 + j] & 0xff) << 16);
        ret = ret | ((uint8Buff[6 + j] & 0xff) << 8);
        ret = ret | ((uint8Buff[7 + j] & 0xff) << 0);
        v = ret;
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: manually uint8list# ${end - start} ${v}");
  });

  unit.test("bytes: manually uint8list", (){
    int start = new DateTime.now().millisecondsSinceEpoch;
    int v = 0;
    int ret =0;
    int j=0;
    for(int i=0;i<s;i++) {
      for (int i = 0; i < l; i++) {
        ret = 0;
        j = i%(s-8);
        ret = uint8Buff.buffer.asByteData().getUint64(i%(s-8));
        v = ret;
      }
    }
    int end = new DateTime.now().millisecondsSinceEpoch;
    print("#bytes: manually uint8list# ${end - start} ${v}");
  });
}