import 'dart:convert';
import 'dart:io';

class Transaction {
  final String category;
  final double amount;
  final String note;
  final DateTime timestamp;

  Transaction(this.category, this.amount, this.note)
      : timestamp = DateTime.now();

  Map<String, dynamic> toJson() => {
        'category': category,
        'amount': amount,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        json['category'],
        json['amount'].toDouble(),
        json['note'],
      );
}

class Ledger {
  List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void saveToFile(String filename) {
    var file = File(filename);
    var jsonList =
        transactions.map((transaction) => transaction.toJson()).toList();
    file.writeAsStringSync(jsonEncode(jsonList));
  }

  void loadFromFile(String filename) {
    var file = File(filename);
    if (file.existsSync()) {
      var jsonString = file.readAsStringSync();
      var jsonList = jsonDecode(jsonString) as List;
      transactions =
          jsonList.map((json) => Transaction.fromJson(json)).toList();
    }
  }

  double getTotalIncome(DateTime date) {
    return transactions
        .where((transaction) =>
            transaction.amount > 0 &&
            transaction.timestamp.year == date.year &&
            transaction.timestamp.month == date.month)
        .map((transaction) => transaction.amount)
        .fold(0, (prev, amount) => prev + amount);
  }

  double getTotalExpense(DateTime date) {
    return transactions
        .where((transaction) =>
            transaction.amount < 0 &&
            transaction.timestamp.year == date.year &&
            transaction.timestamp.month == date.month)
        .map((transaction) => transaction.amount)
        .fold(0, (prev, amount) => prev + amount);
  }
}

void main() {
  var ledger = Ledger();
  const filename = 'transactions.json';

  try {
    ledger.loadFromFile(filename);
  } catch (e) {
    print('Error loading transactions from file: $e');
  }

  while (true) {
    print("\n1. Add transaction");
    print("2. View total income and expense for a month");
    print("3. Exit");
    stdout.write("Enter your choice: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter category: ");
        var category = stdin.readLineSync();
        stdout.write("Enter amount: ");
        var amount = double.parse(stdin.readLineSync()!);
        stdout.write("Enter note: ");
        var note = stdin.readLineSync();
        var transaction = Transaction(category!, amount, note!);
        ledger.addTransaction(transaction);
        ledger.saveToFile(filename);
        print("Transaction added successfully!");
        break;
      case '2':
        stdout.write("Enter month (1-12): ");
        var month = int.parse(stdin.readLineSync()!);
        stdout.write("Enter year: ");
        var year = int.parse(stdin.readLineSync()!);
        var totalIncome = ledger.getTotalIncome(DateTime(year, month));
        var totalExpense = ledger.getTotalExpense(DateTime(year, month));
        print("Total income: $totalIncome");
        print("Total expense: $totalExpense");
        break;
      case '3':
        exit(0);
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
