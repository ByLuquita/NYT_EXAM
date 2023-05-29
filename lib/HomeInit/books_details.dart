import 'package:flutter/material.dart';
import '../../HomeInit/books_details.dart';
import '../../models/books_reviews.dart';

class BookDetailsPage extends StatelessWidget {
  final BooksReview booksReview;
  const BookDetailsPage({super.key, required this.booksReview });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe dos livros'),
      ),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Center( 
            child: Image.network(
              booksReview.img,
              width: (300),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Text(booksReview.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          textAlign: TextAlign.left,),
          const SizedBox(
            height: 12,
          ),
          Text(
            booksReview.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
         
        ],
      )),
    );
  }
}