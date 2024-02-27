import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:lunar_calendar_converter_new/lunar_solar_converter.dart';

// Kiểm tra xem targetDate có nằm trong khoảng từ startDate đến endDate hay không
bool isWithinDateRange(
    DateTime targetDate, DateTime startDate, DateTime endDate) {
  return targetDate.isAfter(startDate) && targetDate.isBefore(endDate);
}

// Tìm thứ 2 (Monday) gần nhất trong tương lai
DateTime findNextMonday() {
  DateTime today = DateTime.now();
  int daysUntilNextMonday = (DateTime.monday - today.weekday) % 7;
  DateTime nextMonday = today.add(Duration(days: daysUntilNextMonday));
  return nextMonday;
}

void main() {
  // Ví dụ sử dụng các chức năng
  DateTime startDate = DateTime(2024, 2, 25);
  DateTime endDate = DateTime(2024, 3, 10);
  DateTime targetDate = DateTime(2024, 3, 1);

  print(isWithinDateRange(
      targetDate, startDate, endDate)); // In ra true hoặc false

  print(findNextMonday()); // In ra thứ 2 gần nhất trong tương lai

  // Tạo một đối tượng Solar đại diện cho ngày dương lịch
  Solar solar = Solar(solarYear: 2018, solarMonth: 8, solarDay: 22);
  // Sử dụng hàm solarToLunar để chuyển đổi từ ngày dương lịch sang ngày âm lịch
  Lunar lunar = LunarSolarConverter.solarToLunar(solar);
  // In ra kết quả
  print(
      "Ngày âm lịch: ${lunar.lunarYear}/${lunar.lunarMonth}/${lunar.lunarDay}");
}
