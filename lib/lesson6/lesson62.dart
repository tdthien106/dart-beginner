import 'dart:io';

void main() {
  print('Nhập doanh thu (VND): ');
  String inputRevenue = stdin.readLineSync() ?? '';

  try {
    // Chuyển đổi doanh thu từ chuỗi sang số thực
    double revenue = double.parse(inputRevenue);

    // Xác định thuế bán hàng dựa trên điều kiện
    double taxRate;

    if (revenue >= 0 && revenue <= 10000000) {
      // Doanh thu từ 0 -> 10 triệu
      print('Mặt hàng có phải là bia rượu? (true/false): ');
      bool isAlcohol = (stdin.readLineSync()?.toLowerCase() == 'true');

      taxRate = isAlcohol ? 0.13 : 0.10;
    } else if (revenue > 10000000 && revenue <= 20000000) {
      // Doanh thu từ 10 -> 20 triệu
      print('Mặt hàng có phải là bia rượu? (true/false): ');
      bool isAlcohol = (stdin.readLineSync()?.toLowerCase() == 'true');

      taxRate = isAlcohol ? 0.15 : 0.12;
    } else if (revenue > 20000000 && revenue <= 30000000) {
      // Doanh thu từ 20 -> 30 triệu
      taxRate = 0.18;
    } else {
      // Trường hợp khác
      print('Doanh thu không hợp lệ.');
      return;
    }

    // Tính thuế bán hàng và tổng thanh toán
    double tax = revenue * taxRate;
    double totalPayment = revenue + tax;

    // In ra kết quả
    print('Doanh thu: $revenue VND');
    print('Thuế bán hàng ($taxRate): ${tax.toStringAsFixed(2)} VND');
  } catch (e) {
    print('Định dạng không hợp lệ. Hãy nhập số thực.');
  }
}
