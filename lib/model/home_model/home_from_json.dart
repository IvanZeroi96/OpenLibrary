import 'dart:convert';

HomeObj homeObjFromJson(String str) => HomeObj.fromJson(json.decode(str));

//String homeObjToJson(HomeObj data) => json.encode(data.toJson());

class HomeObj {
  HomeObj({
    this.start,
    this.numFound,
    this.docs,
  });

  int? start;
  int? numFound;
  List<Doc>? docs;

  factory HomeObj.fromJson(Map<String, dynamic> json) => HomeObj(
    start: json["start"] ?? 0,
    numFound: json["num_found"] ?? 0,
    docs: json["docs"] != null ? List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))) : null,
  );

  /*Map<String, dynamic> toJson() => {
    "start": start,
    "num_found": numFound,
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
  };*/
}

class Doc {
  Doc({
    this.coverI,
    this.hasFulltext,
    this.editionCount,
    this.title,
    this.authorName,
    this.firstPublishYear,
    this.key,
    this.ia,
    this.authorKey,
    this.publicScanB,
  });

  int? coverI;
  bool? hasFulltext;
  int? editionCount;
  String? title;
  List<String>? authorName;
  int? firstPublishYear;
  String? key;
  List<String>? ia;
  List<String>? authorKey;
  bool? publicScanB;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    coverI: json["cover_i"] ?? 0,
    hasFulltext: json["has_fulltext"] ?? false,
    editionCount: json["edition_count"] ?? 0,
    title: json["title"] ?? '',
    authorName: json["author_name"] != null ? List<String>.from(json["author_name"].map((x) => x)) : [],
    firstPublishYear: json["first_publish_year"] ?? 0,
    key: json["key"] ?? '',
    ia: json["ia"] != null ? List<String>.from(json["ia"].map((x) => x)) : [],
    authorKey: json["author_key"] != null ? List<String>.from(json["author_key"].map((x) => x)) : [],
    publicScanB: json["public_scan_b"] ?? false,
  );

  /*Map<String, dynamic> toJson() => {
    "cover_i": coverI,
    "has_fulltext": hasFulltext,
    "edition_count": editionCount,
    "title": title,
    "author_name": List<dynamic>.from(authorName.map((x) => x)),
    "first_publish_year": firstPublishYear,
    "key": key,
    "ia": List<dynamic>.from(ia.map((x) => x)),
    "author_key": List<dynamic>.from(authorKey.map((x) => x)),
    "public_scan_b": publicScanB,
  };*/
}
