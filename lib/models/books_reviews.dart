class BooksReview {
  int ibsn = 0;
  String author = " ";
  String title = " ";
  String img = " ";

  BooksReview(
    this.ibsn,
    this.author,
    this.img,
    this.title,
    
    );

  BooksReview.fromJson(Map<String, dynamic> json) {
    ibsn = json['ibsn'] ?? 0;
    author = json ['author'] ?? " ";
    title = json ['title'] ?? " ";
    img = json ['img']?? " ";
  }

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data  = <String, dynamic>{};
      data['ibsn'] = ibsn;
      data['author'] = author;
      data['title'] = title;
      data['img'] = img;
      return data;
    }
}