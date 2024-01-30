void main() {
  Map playersInfo = {
    'Name': 'Thiên',
    'Age': 21,
    'Height': 175,
    'Position': ['Student', 'Intern'],
    'DateOfBirth': '10-06-2002',
    'PlayedClubs': ['SAB', 'Esports'],
    'IsMale': true
  };
  print("--Player Infomation: ");
  print("Name: ${playersInfo['Name']}");
  playersInfo.forEach((key, value) {
    print('$key: $value');
  });

  
}
