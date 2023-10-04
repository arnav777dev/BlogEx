import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

class Blog {
  final String id;
  final String imageUrl;
  final String title;

  Blog({required this.id, required this.imageUrl, required this.title});
}


class apidata {
  List<Blog> blogs = [];

  Future<void> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final blogList = jsonData['blogs'] as List<dynamic>;

        blogs = blogList.map((blogData) {
          return Blog(
            id: blogData['id'] as String,
            imageUrl: blogData['image_url'] as String,
            title: blogData['title'] as String,
          );
        }).toList();
      } else {
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
