import 'package:dio/dio.dart';

import '../../../core/app_exports.dart';
import '../Model/blog_model.dart';

class BlogController extends GetxController {
  static final dio = Dio();
  final List<BlogModel> _blogList = [];
  static const url =
      "https://tripmate-tourism-management.onrender.com/blogs/get-all";
  List<BlogModel> get blogs => _blogList;

  void fetchAndSetBlog() async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': '',
          },
        ),
      );

      for (int i = 0; i < response.data.length; i++) {
        var blogModel = response.data[i];
        print('Response data length: ${response.data.length}');

        _blogList.add(BlogModel(
          id: blogModel['_id'],
          title: blogModel['blog_title'],
          description: blogModel['blog_description'],
          imageUrl: blogModel['blog_image'],
          dateTime: blogModel['blog_date'],
        ));

        update();
      }
    } catch (e) {}
  }
}
