import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

////////////////////// get data////////////////
  Future<List<dynamic>> getPosts() async {
    final response = await dio.get("/posts");
    return response.data;
  }
  Future<Map<String, dynamic>> getPostById(int id) async {
    final response = await dio.get("/posts/$id");
    return response.data;
  }

  Future<List<dynamic>> getCommentsByPost(int postId) async {
    final response = await dio.get("/posts/$postId/comments");
    return response.data;
  }
  Future<List<dynamic>> getCommentsUsingQuery(int postId) async {
    final response = await dio.get(
      "/comments",
      queryParameters: {"postId": postId},
    );
    return response.data;
  }
  Future<Map<String, dynamic>> createPost() async {
    final response = await dio.post(
      "/posts",
      data: {
        "title": "My Title",
        "body": "My Body",
        "userId": 1,
      },
    );
    return response.data;
  }
  Future<Map<String, dynamic>> updatePostPatch(int id) async {
    final response = await dio.patch(
      "/posts/$id",
      data: {
        "title": "Partially Updated Title",
      },
    );
    return response.data;
  }
  Future<void> deletePost(int id) async {
    await dio.delete("/posts/$id");
  }


}
