import 'package:dio/dio.dart';

const kAppName = 'Movies';
const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTM3ZTQwZWI2OWJkNGM3YjdiY2MwYTVlZWE0NWUxMiIsInN1YiI6IjVmOGM2ZTEyODlmNzQ5MDAzOWZlYmMxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iBA7CeiRMA_f7Ygpy8BbOPp_U1AhDPeE4R7ArhLsiZ8';
const kServerError = 'Failed to connect to the server. Try again later';
final kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $kApiKey'},
);
