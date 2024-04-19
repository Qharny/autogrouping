
import 'dart:io';

void main() {
  stdout.write('Select the data type:\n'
                '1. File (Read from an external file)\n'
                '2. Strings\n'
                '3. Numbers/Integers\n'
                'Enter your choice: ');
  var choice = int.parse(stdin.readLineSync()!);

  List<dynamic> inputData = [];

  switch (choice) {
    case 1:
      inputData = readFromFile();
      break;
    case 2:
      inputData = readStrings();
      break;
    case 3:
      inputData = readNumbers();
      break;
    default:
      print('Invalid choice');
      return;
  }

  stdout.write('Enter the number of groups: ');
  var numOfGroups = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the number of entities in each group: ');
  var entitiesPerGroup = int.parse(stdin.readLineSync()!);

  print('Please wait... Your grouping will be done soon');

  var groupedData = groupData(inputData, numOfGroups, entitiesPerGroup);

  storeDataToFile(groupedData, 'grouped_data.txt');

  print('Grouping completed. Check grouped_data.txt for the result.');
}

List<dynamic> readFromFile() {
  stdout.write('Enter the file name: ');
  var filename = stdin.readLineSync()!;
  try {
    var file = File(filename);
    var lines = file.readAsLinesSync();
    return lines;
  } catch (e) {
    print('Error reading file: $e');
    return [];
  }
}

List<String> readStrings() {
  List<String> strings = [];
  while (true) {
    stdout.write('Enter a string (type "exit" to stop): ');
    var input = stdin.readLineSync();
    if (input == 'exit') {
      break;
    }
    strings.add(input!);
  }
  return strings;
}

List<int> readNumbers() {
  List<int> numbers = [];
  while (true) {
    stdout.write('Enter a number (type 0 to stop): ');
    var input = int.tryParse(stdin.readLineSync()!);
    if (input == 0) {
      break;
    }
    numbers.add(input!);
  }
  return numbers;
}

List<List<dynamic>> groupData(List<dynamic> data, int numOfGroups, int entitiesPerGroup) {
  List<List<dynamic>> groupedData = [];
  for (int i = 0; i < numOfGroups; i++) {
    var start = i * entitiesPerGroup;
    var end = (i + 1) * entitiesPerGroup;
    if (end > data.length) {
      end = data.length;
    }
    groupedData.add(data.sublist(start, end));
  }
  return groupedData;
}

void storeDataToFile(List<List<dynamic>> data, String filename) {
  var file = File(filename);
  var sink = file.openWrite();

  for (var i = 0; i < data.length; i++) {
    sink.writeln('Group ${i + 1}:');
    for (var item in data[i]) {
      sink.writeln(item);
    }
    sink.writeln(); // Add a blank line between different groups
  }

  sink.close();
}
