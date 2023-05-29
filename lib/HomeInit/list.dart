import 'package:delbank_exam/HomeInit/books_details.dart';
import 'package:flutter/material.dart';

import '../models/books_reviews.dart';

class MyList extends StatelessWidget {
  final BooksReview booksReview;
  const MyList({super.key, required  this.booksReview});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        ListTile(
          leading: Hero(tag: booksReview.ibsn, 
          child: CircleAvatar(backgroundImage: NetworkImage(booksReview.img),)),
          title:  Text(booksReview.title),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(booksReview.title),
          ],),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => BookDetailsPage(booksReview: booksReview)));
          },
        ),
        const Divider(
          thickness: 2.0,
        )
      ],
    ),);
  }
}