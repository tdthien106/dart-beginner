import 'dart:io';

void main() {
  try {
    print("Nhập tên công ty: ");
    String companyName = stdin.readLineSync() ?? '';

    if (companyName.length >= 12) {
      String ans = companyName.substring(11, 12);
      print("Ký tự thứ 12 của công ty: $ans");
    } else {
      throw Exception("Chuỗi không đủ dài");
    }
  } catch (e) {
    print("Đã xảy ra một exception: $e");
  }
}
  