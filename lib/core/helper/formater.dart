import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class Formater{

   String date(String date,String locale){
    return DateFormat.yMMMMd(
      
       locale
      
    ).format(DateTime.parse(date));
  }

}