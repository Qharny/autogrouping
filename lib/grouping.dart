List<List<dynamic>> groupData(
    List<dynamic> data, int numOfGroups, int GroupEntities) {
  List<List<dynamic>> groupedData = [];

  for (int i = 0; i < numOfGroups; i++) {
    var start = i * GroupEntities;
    var end = (i + 1) * GroupEntities;
    if (end > data.length) {
      end = data.length;
    }
    groupedData.add(data.sublist(start, end));
  }
  return groupedData;
}
