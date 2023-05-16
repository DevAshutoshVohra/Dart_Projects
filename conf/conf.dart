class Config  {


  static final Config _singleton = Config._internal();

  String apiKey = 'c15012650ac74b2a93594354231605';
  String rootApiUrl='api.weatherapi.com';
  String rootApiPath='/v1/forecast.json';
  
  factory Config(){
    return _singleton;
  }

  Config._internal(); 

}