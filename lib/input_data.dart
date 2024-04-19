// function for reading file
import 'dart:io';

List<dynamic> readFromFile() {
  // Read data from an external file
  stdout.write('Enter the name of the file: ');
  var fileName = stdin.readLineSync()!;

  // error handling for the file
  try {
    var file = File(fileName);
    var data = file.readAsStringSync();
    return data.split(' ');
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

// function for acceoting strings
List<String> readStrings() {
  List<String> strings = []; // list to store Strings
  while (true) {
    stdout.write('Enter the strings (type exit to stop): ');
    var input = stdin.readLineSync()!;
    if (input == 'exit') {
      break;
    }
    strings.add(input);
  }
  return strings;
}

// function for accepting intergers
List<int> readNumbers() {
  List<int> numbers = []; // list to store numbers
  while (true) {
    stdout.write('Enter the numbers (type 0 to stop): ');
    int inputNum = int.parse(stdin.readLineSync()!);
    if (inputNum == 0) {
      break;
    }
    numbers.add(inputNum);
  }
  return numbers;
}
