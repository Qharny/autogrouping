
import 'dart:io';

void main() {
  // Accept input from the user
  List<dynamic> inputData = [];
  while (true) {
    stdout.write('Enter a name or string (type "exit" to stop): ');
    var input = stdin.readLineSync();
    if (input == 'exit') {
      break;
    }
    inputData.add(input);
  }

  // Group the accepted values
  var groupedData = groupData(inputData);

  // Store the grouped values in an external file
  storeDataToFile(groupedData, 'data.txt');

  print('Data stored successfully in data.txt');
}

Map<Type, List<dynamic>> groupData(List<dynamic> data) {
  Map<Type, List<dynamic>> groupedData = {};

  for (var item in data) {
    Type type = item.runtimeType;
    if (!groupedData.containsKey(type)) {
      groupedData[type] = [];
    }
    groupedData[type]!.add(item);
  }

  return groupedData;
}

void storeDataToFile(Map<Type, List<dynamic>> data, String filename) {
  var file = File(filename);
  var sink = file.openWrite();

  data.forEach((key, value) {
    sink.writeln('$key:');
    for (var item in value) {
      sink.writeln(item);
    }
    sink.writeln(); // Add a blank line between different types of data
  });

  sink.close();
}
