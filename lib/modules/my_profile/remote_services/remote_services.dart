import 'package:ethos/modules/my_profile/model/myprofile_model.dart';
import 'package:http/http.dart' as http;


class RemoteServices {
  static var client = http.Client();

  static Future<ProfileModel?> fetchProfile() async {
    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU3OTU2MTA4LCJleHAiOjE2NTgwNDI1MDh9.2a5pKBcZOmOi56FroYomV-TxinECRN_HQeYBNwsx_Zk";
    var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/myProfile');
    var response = await http.get(url, headers: {"Content-Type": "application/json","Authorization": "Bearer $token"});
    // var response = await client.get(Uri.parse(
    //     'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      // return profileModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}