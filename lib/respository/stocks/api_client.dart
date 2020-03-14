


import 'package:dio/dio.dart';
import 'package:sma/helpers/http_client.dart';
import 'package:sma/models/stock_profile.dart';

class StockClient {

  final FetchClient _client = FetchClient();
  final String _authority = 'financialmodelingprep.com';

  Future<StockProfile> fetchProfile(String symbol) async {

    final Uri uri = Uri.https(_authority, '/api/v3/company/profile/$symbol');
    final Response<dynamic> response = await this._client.fetchData(uri: uri);
    
    final data = response.data;
    final StockProfile stockProfile = StockProfile.fromJson(data['profile']);

    return stockProfile;
  }

}

