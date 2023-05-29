import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/books_reviews.dart';

const String url = 'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=P94Wb2dNs8V9hZqWbBqYUZpLgILGuTXg';

List<BooksReview> parseBooksReview (String responseBody){
var list = json.decode(responseBody)['results']['books'];
var booksReview = list.map((e) => BooksReview.fromJson(e)).toList().cast<BooksReview>();
return booksReview;
}

Future<List<BooksReview>> fetchBooksReview() async {
  final http.Response response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    return compute(parseBooksReview, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}