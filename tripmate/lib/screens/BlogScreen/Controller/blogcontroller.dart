import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../Model/blog_model.dart';

class BlogController extends GetxController {
  static final dio = Dio();
  final List<BlogModel> _blogList = [];
  final String url = "${dotenv.env['BACKEND_URL']}/blogs/get-all";
  List<BlogModel> get blogs => _blogList;
  var filteredBlogList = <BlogModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndSetBlog();
  }

  Future<void> fetchAndSetBlog() async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': '', // You might want to add your token here
          },
        ),
      );

      if (response.statusCode == 200) {
        _blogList.clear(); // Clear the list before adding new data
        for (var blogData in response.data) {
          _blogList.add(BlogModel(
            id: blogData['_id'],
            title: blogData['blog_title'],
            description: blogData['blog_description'],
            imageUrl: blogData['blog_image'],
            dateTime: blogData['blog_date'],
          ));
        }
        filteredBlogList.assignAll(_blogList);
        update();
      } else {
        // Handle the case where the response is not 200
        print('Failed to load blogs: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching blogs: $e');
    }
  }

  void filterBlogList(String value) {
    if (value.isEmpty) {
      filteredBlogList.assignAll(_blogList);
    } else {
      filteredBlogList.assignAll(_blogList.where(
        (blog) => blog.title.toLowerCase().contains(value.toLowerCase()),
      ));
    }
    update();
  }
}
