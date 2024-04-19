// int calculate() {
//   return 6 * 7;
// }

import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {
  prompt();
}

prompt() {
  // Prompt user to select choice
  stdout.write('AUTO GROUPING\n'
      '\n'
      'Select the data type:\n'
      '1. File (Read from an external file)\n'
      '2. Strings\n'
      '3. Numbers/Integers\n'
      'Enter your choice: ');

  // get user input
  var choice = int.parse(stdin.readLineSync() ?? '');

  List<dynamic> inputData = []; // List to store the data
  // a switch case to get choice
  switch (choice) {
    case 1:
      inputData = readFromFile();
      break;
    case 2:
      inputData = readStrings();
      break;
    case 3:
      inputData = readNumbers();
  }
}

// function for reading file
List<dynamic> readFromFile() {
  // Read data from an external file
  stdout.write('Enter the name of the file: ');
  var fileName = stdin.readLineSync()!;

  // error handling for the file
  try {
    var file = File(fileName);
    var data = file.readAsStringSync();
    return data.split(',');
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
List<Int> readNumbers() {
  List<Int> numbers = []; // list to store numbers
  while (true) {
    stdout.write('Enter the numbers (type 0 to stop): ');
    int inputNum = int.parse(stdin.readLineSync()!);
    if (inputNum == 0) {
      break;
    }
    numbers.add(inputNum as Int);
  }
  return numbers;
}
