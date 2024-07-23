extension DateTimeExtension on DateTime {
  String get brazilianDateTime {
    String formattedDay = '${day < 10 ? '0' : ''}$day';
    String formattedMonth = '${month < 10 ? '0' : ''}$month';
    
    String formattedHour = '${hour < 10 ? '0' : ''}$hour';
    String formattedMinute = '${minute < 10 ? '0' : ''}$minute';
    
    return '$formattedDay/$formattedMonth/$year $formattedHour:$formattedMinute';
  }
}
