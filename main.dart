import 'dart:io';
import 'conf/conf.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
bool isZipCodeFormatValid(String zipcode) {
  /// the regular expression allows us to use 5 digit zipCode or 9 digin ZipCode,
  ///
  if (RegExp(r"^\d{5}(-\d{4})?#").hasMatch(zipcode))
    return true;
  else
    return false;
}

// String getZipCode() {
//   String zipcode;
//   do {
//     stdout.write('  Enter a Zip Code  ');
//     zipcode = stdin.readLineSync()!;
//   } while (zipcode.isEmpty);
//   return zipcode;
// }

void main() async{
  print('    Welcome To a Command Line Weather Application  !!!   ');


 // String zipcode = getZipCode();
print('  Enter A city  !!! ');
String city = stdin.readLineSync()!;
  
  // do {
  //   zipcode = getZipCode();

  //   zipcode = getZipCode();
  // } while (!isZipCodeFormatValid(zipcode));

  print(' YOUR ENTERED City  IS :- \n $city');



  Uri api_url=Uri.http( Config().rootApiUrl , Config().rootApiPath , { 'key':Config().apiKey , 'q':city  , 'aqi':'no'  , 'days'  : '1'} );
  print(api_url);

  var response = await http.get(api_url);
  //print(response.body);


  
  if(response.statusCode  ==  200){
    Map<String,dynamic>jsonData=jsonDecode(response.body);

    print(jsonData['location']);
    print(' Successfully Got Response ');

  }else print(' Error Occured ');

//  65676

}
