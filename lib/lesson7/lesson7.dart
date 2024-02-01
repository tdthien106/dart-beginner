import 'dart:io';

void main() {
  bool exitt = false;
  while (!exitt) {
    print("--Bài tập");
    print("1. Tìm tất cả ước của một số được nhập từ bàn phím");
    print("2. Nhập một chuỗi, in ra thứ tự và ký tự tại thứ tự đó");
    print("3. Nhập  một số bất kỳ bé hơn 20, tính giai thừa của số đó");
    print("4. In ra bảng cửu chương của một số nhập từ bàn phím");
    print("0. Dừng chương trình");
    print("Your input: ");
    String input = stdin.readLineSync() ?? '';
    try {
      var req = int.tryParse(input);
      switch (req) {
        case 1:
          print("Nhập số cần tìm ước: ");
          int number = int.parse(stdin.readLineSync() ?? '0');
          findDiv(number);
          break;
        case 2:
          print("Nhập chuỗi: ");
          String str = stdin.readLineSync() ?? '';
          printCharactersAndIndices(str);
          break;
        case 3:
          print("Nhập số (bé hơn 20): ");
          int num = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          if (num < 20) {
            int factorialResult = calculateFactorial(num);
            print("Giai thừa của $num là $factorialResult");
          } else {
            print("Số nhập vào phải bé hơn 20");
          }
          break;
        case 4:
          print("Nhập số cần in bảng cửu chương: ");
          int multiplicationTableNumber =
              int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          printMultiplicationTable(multiplicationTableNumber);
          break;
        case 0:
          print("Dừng chương trình");
          exitt = true;
          break;
      }
    } catch (e) {
      print("Thao tác không hợp lệ");
    }
    if (!exitt) {
      print("Ấn phím bất kỳ để quay lại Menu");
      stdin.readLineSync();
    }
  }
}

void findDiv(int number) {
  print("Ước của $number là: ");
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}

void printCharactersAndIndices(String str) {
  print("Thứ tự và ký tự tại thứ tự đó trong chuỗi:");
  for (int i = 0; i < str.length; i++) {
    print("Thứ tự $i: ${str[i]}");
  }
}

int calculateFactorial(int num) {
  if (num == 0 || num == 1) {
    return 1;
  }
  return num * calculateFactorial(num - 1);
}

void printMultiplicationTable(int number) {
  print("Bảng cửu chương của $number:");
  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }
}
