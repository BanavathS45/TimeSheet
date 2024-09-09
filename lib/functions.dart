Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  return 'Data fetched';
}

void main() async {
  print('Fetching data...');
  String data = await fetchData();
  print(data); // Output after 2 seconds: Data fetched
}