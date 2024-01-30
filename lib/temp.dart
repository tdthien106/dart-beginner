import 'dart:io';

void main() {
  print("Your input: ");
  String input = stdin.readLineSync() ?? '';
  try {
    double points = double.parse(input);

    if (points >= 8.0 && points <= 10.0)
      print("Gioi");
    else if (points >= 6.5 && points < 8.0)
      print("Kha");
    else if (points >= 5.0 && points < 6.5)
      print("Trung binh");
    else if (points >= 0 && points < 5.0)
      print("Yeu");
    else
      print("Điểm không hợp lệ");
  } catch (e) {
    print("Nội dung không phù hợp");
  }
}
