import 'package:delbank_exam/HomeInit/homePage.dart';
import 'package:flutter/material.dart';
import '../../models/books_reviews.dart';
import '../../controllers/books_controller.dart';
import '../HomeInit/list.dart';
import '../components/loading.dart';
import '../components/search.dart';


class HomeP1 extends StatefulWidget {
  const HomeP1({super.key, required String title});

  @override
  State<HomeP1> createState() => _HomeP1State();
}

class _HomeP1State extends State<HomeP1> {
  final List<BooksReview> _booksreview = <BooksReview>[];
  List<BooksReview> _booksreviewDisplay = <BooksReview>[];
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchBooksReview().then((value) {
      setState(() {
        _isLoading = false;
        _booksreview.addAll(value);
        _booksreviewDisplay = _booksreview;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(child: ListView.builder(
        itemBuilder: (context, index){
          if(_isLoading){
            return index == 0
            ? MySearch(
              hintText: 'nome, autor, ou isbn',
              onChanged: (searchText){
                searchText = searchText.toLowerCase();
                setState(() {
                  _booksreviewDisplay = _booksreview.where((u) {
                    var titleLowerCase = u.title.toLowerCase();
                    var authorLowerCase = u.author.toLowerCase();
                    return titleLowerCase.contains(searchText) || 
                    authorLowerCase.contains(searchText ); 
                  } ) .toList();
                });
              },
            ) : MyList(booksReview: _booksreviewDisplay[index - 1]);
          } else {
            return const MyLoading();
          }
        },
        itemCount: _booksreviewDisplay.length+1,
        )),
      
    );
  }
}