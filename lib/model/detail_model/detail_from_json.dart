import 'dart:convert';

DetalleObj detalleObjFromJson(String str) => DetalleObj.fromJson(json.decode(str));

//String detalleObjToJson(DetalleObj data) => json.encode(data.toJson());

class DetalleObj {
  DetalleObj({
    this.description,
    this.title,
    this.covers,
    this.subjectPlaces,
    this.subjects,
    this.subjectPeople,
    this.key,
    this.authors,
    this.subjectTimes,
    this.type,
    this.latestRevision,
    this.revision,
    this.created,
    this.lastModified,
  });

  String? description;
  String? title;
  List<int>? covers;
  List<String>? subjectPlaces;
  List<String>? subjects;
  List<String>? subjectPeople;
  String? key;
  List<Author>? authors;
  List<String>? subjectTimes;
  Type? type;
  int? latestRevision;
  int? revision;
  Created? created;
  Created? lastModified;

  factory DetalleObj.fromJson(Map<String, dynamic> json) => DetalleObj(
    description: json["description"] ?? '',
    title: json["title"] ?? '',
    covers: json["covers"] != null ? List<int>.from(json["covers"].map((x) => x)) : [],
    subjectPlaces: json["subject_places"] != null ? List<String>.from(json["subject_places"].map((x) => x)) : [],
    subjects: json["subjects"] != null ? List<String>.from(json["subjects"].map((x) => x)) : [],
    subjectPeople: json["subject_people"] != null ? List<String>.from(json["subject_people"].map((x) => x)) : [],
    key: json["key"] ?? '',
    authors: json["authors"] != null ? List<Author>.from(json["authors"].map((x) => Author.fromJson(x))) : [],
    subjectTimes: json["subject_times"] != null ? List<String>.from(json["subject_times"].map((x) => x)) : [],
    type: Type.fromJson(json["type"]),
    latestRevision: json["latest_revision"] ?? 0,
    revision: json["revision"] ?? 0,
    created: json["created"] != null ? Created.fromJson(json["created"]) : null,
    lastModified: json["last_modified"] != null ? Created.fromJson(json["last_modified"]) : null,
  );
}

class Author {
  Author({
    this.author,
    this.type,
  });

  Type? author;
  Type? type;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    author: json["author"] != null ? Type.fromJson(json["author"]) : null,
    type: json["type"] != null ? Type.fromJson(json["type"]) : null,
  );

}

class Type {
  Type({
    this.key,
  });

  String? key;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    key: json["key"] ?? '',
  );
}

class Created {
  Created({
    this.type,
    this.value,
  });

  String? type;
  DateTime? value;

  factory Created.fromJson(Map<String, dynamic> json) => Created(
    type: json["type"] ?? '',
    value: json["value"] != null ? DateTime.parse(json["value"]) : null,
  );
}
