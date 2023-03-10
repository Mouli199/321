import 'dart:async';
import 'dart:convert' ;
import 'package:crypto_project/data/crypto_data.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttercrypto/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {
  String cryptoUri = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    // TODO: implement fetchCurrencies
    http.Response response = await http.get(cryptoUri, headers: {"X-CMC_PRO_API_KEY": "cab79c7b-52e9-4e4b-94fc-b0f32da14799"});
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }
}
