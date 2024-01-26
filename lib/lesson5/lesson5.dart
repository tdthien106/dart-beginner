//Trịnh Đức Thiên
//Tạo một danh sách tên cầu thủ của 1 đội bóng, in ra màn hình,
//thử nghiệm với hàm suffle, in ra màn hình,
//sau đó add thêm tên huấn luyện viên của đội bóng đó ở vị trí đầu tiên.

import 'dart:math';

int main() {
  var players = [
    "P1",
    "P2",
    "P3",
    "P4",
    "P5",
    "P6",
    "P7",
    "P8",
    "P9",
    "P10",
    "P11",
    "P12"
  ];

  print("--Danh sách đội bóng trước khi shuffle: ");
  for (var player in players) print(player);

  print("--Danh sách đội bóng sau khi shuffle: ");
  players.shuffle();
  for (var player in players) print(player);

  print("--Danh sách đội bóng sau khi có HLV: ");
  var coach = "HLV";
  players.insert(0, coach);
  for (var player in players) print(player);

  return 0;
}
