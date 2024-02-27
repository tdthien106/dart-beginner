import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:date_format/date_format.dart';

class Transaction {
  String category;
  DateTime date;
  double amount;
  String? note;

  Transaction({
    required this.category,
    required this.date,
    required this.amount,
    this.note,
  });

  Map<String, dynamic> toJson() => {
        'category': category,
        'date': date.toIso8601String(),
        'amount': amount,
        'note': note,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        category: json['category'],
        date: DateTime.parse(json['date']),
        amount: json['amount'],
        note: json['note'],
      );
}

void main() {
  List<Transaction> transactions = [];

  while (true) {
    try {
      print('Enter transaction details:');
      print('Category:');
      String category = stdin.readLineSync() ?? '';
      print('Date (DD-MM-YYYY):');
      DateTime date = DateTime.parse(stdin.readLineSync() ?? '1-1-1974');
      print('Amount:');
      double amount = double.parse(stdin.readLineSync() ?? '0');
      print('Note:');
      String note = stdin.readLineSync() ?? '';
      transactions.add(Transaction(
        category: category,
        date: date,
        amount: amount,
        note: note,
      ));

      print('Do you want to add another transaction? (Y/N)');
      String continueInput = stdin.readLineSync()?.toUpperCase() ?? '';
      if (continueInput != 'Y') {
        break;
      }
    } catch (e) {
      print("Invailed");
    }
  }

  writeToJSON(transactions, 'transactions.json');

  readFromJSON('transactions.json');
}

void writeToJSON(List<Transaction> transactions, String fileName) {
  List<Map<String, dynamic>> jsonData =
      transactions.map((t) => t.toJson()).toList();
  File file = File(fileName);
  file.writeAsStringSync(jsonEncode(jsonData));
  print('Data has been written to $fileName');
}

void readFromJSON(String fileName) {
  File file = File(fileName);
  if (!file.existsSync()) {
    print('File not found: $fileName');
    return;
  }

  String jsonString = file.readAsStringSync();
  List<dynamic> jsonData = jsonDecode(jsonString);
  List<Transaction> transactions =
      jsonData.map((data) => Transaction.fromJson(data)).toList();

  print('Transactions:');
  transactions.forEach((transaction) {
    print('Category: ${transaction.category}');
    print('Date: ${formatDate(transaction.date, [yyyy, '-', mm, '-', dd])}');
    print('Amount: ${transaction.amount}');
    print('Note: ${transaction.note}');
    print('---');
  });
}
