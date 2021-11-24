


import 'dart:convert';

import 'dart:typed_data';

class MyDecoder {



  dynamic decodeJSON(Uint8List data){
    return utf8.decode(data);
  }
}