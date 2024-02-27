import 'package:date_format/date_format.dart';

// Hàm kiểm tra xem một ngày có phải là thứ 7 hay chủ nhật không
bool isWeekend(DateTime date) {
  return date.weekday == 6 || date.weekday == 7;
}

// Hàm tính số ngày còn lại đến ngày lễ 30/4/2024
int daysUntilHoliday(DateTime currentDate, DateTime holiday) {
  Duration difference = holiday.difference(currentDate);
  return difference.inDays;
}

void main() {
  // Thời gian hiện tại
  DateTime currentDate = DateTime.now();

  // Kiểm tra xem thời gian hiện tại có phải là cuối tuần hay không
  print("Thời gian hiện tại là cuối tuần: ${isWeekend(currentDate)}");

  // Ngày lễ 30/4/2024
  DateTime holiday = DateTime(2024, 4, 30);

  // Tính số ngày còn lại đến ngày lễ 30/4/2024
  int daysRemaining = daysUntilHoliday(currentDate, holiday);
  print("Số ngày còn lại đến ngày lễ 30/4/2024: $daysRemaining");
}
