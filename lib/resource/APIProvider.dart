import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cctracker/models/CCData.dart';

class APIProvider {

  List<CCData> data = [];
  final apiUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=40&convert=USD&CMC_PRO_API_KEY=28ba80ec-0caa-494e-8ac0-176a5a0e8e4d";

  Future<List<CCData>> loadCC() async{
    final response = await http.get(apiUrl);

    if(response.statusCode == 200){
      print(response.body);

      // var allData = (json.decode(response.body) as Map)['data'] as Map<String, dynamic>;
      //
      // var ccDataList = List<CCData>();
      //
      // allData.forEach((key, value) {
      //   var record = CCData(name: value['name'], symbol: value['symbol'], rank: value['cmc_rank'], price: value['quote']['USD']['price']);
      //   ccDataList.add(record);
      // });

      Map<String, dynamic> allData = json.decode(response.body);
      List<dynamic> ccData = allData["data"];

      var ccDataList = List<CCData>();

      ccData.forEach((element) {
        var record = CCData(name: element['name'], symbol: element['symbol'], rank: element['cmc_rank'], price: checkDouble(element['quote']['USD']['price']));
        ccDataList.add(record);
      });

      // setState(() {
         data = ccDataList;
      // });

    }
    return data;

  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value;
    }
  }

}