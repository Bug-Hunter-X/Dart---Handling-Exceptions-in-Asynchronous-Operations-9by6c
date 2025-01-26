```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Check for null values before accessing them
        if (jsonData != null && jsonData['data'] != null) {
          // ... process jsonData['data']...
        } else {
          print('Warning: JSON data or data field is null');
        }
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Consider logging the error to an external service or handling it gracefully
  }
}
```