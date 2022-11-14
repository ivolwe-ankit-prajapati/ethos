import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Provider extends GetConnect{

  Future<dynamic> getProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString("token");
    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU3NDQ2OTI4LCJleHAiOjE2NTc1MzMzMjh9.PVyYFttF93fJBY8qCLmtoiZ_FAooIlCwmB8izAb8abs";
    var url = Uri.parse('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/api/mobile/user/myProfile');
    final response = await get('http://ec2-13-235-73-248.ap-south-1.compute.amazonaws.com/apimobile/user/myProfile', headers: {"Content-Type": "application/json","Authorization": "Bearer $token"});

    // final response = await get('http://www.json-generator.com/api/json/get/cfrJFXLTAO?indent=2');
    print(response);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}