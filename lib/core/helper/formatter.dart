import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class Formatter{

   String date(String date,String locale){
    return DateFormat.yMMMMd(
      
       locale
      
    ).format(DateTime.parse(date));
  }

}