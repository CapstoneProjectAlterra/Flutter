class NewsModel {
  String judul;
  String waktuPublikasi;
  String namaPenulis;
  String content;
  String image;

  NewsModel(
      {required this.judul,
      required this.waktuPublikasi,
      required this.namaPenulis,
      required this.content,
      required this.image});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      judul: json['judul'],
      waktuPublikasi: json['waktuPublikasi'],
      namaPenulis: json['namaPenulis'],
      content: json['content'],
      image: json['image']);
  Map<String, dynamic> toJson() => {
        'judul': judul,
        'waktuPublikasi': waktuPublikasi,
        'namaPenulis': namaPenulis,
        'content': content,
        'image': image
      };
}
