import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String? time;
  String country;
  String url;

  WorldTime({required this.country,required this.url});

  Future<void> getTime() async{
    try{
      var url=Uri.parse("http://worldtimeapi.org/api/timezone/asia/kolkata");
      Response response= await get(url);
      Map mp=jsonDecode(response.body);
      String dateTime=mp['datetime'];
      String offset_hr=mp['utc_offset'].substring(1,3);
      String offset_min=mp['utc_offset'].substring(4,6);
      DateTime now = DateTime.parse(dateTime);
      now=now.add(Duration(hours: int.parse(offset_hr),minutes: int.parse(offset_min)));
      time=DateFormat.jm().format(now);
      //time=now.toString();
    }
    catch(e){
      time="Couldn't load Data";
    }
  }

}