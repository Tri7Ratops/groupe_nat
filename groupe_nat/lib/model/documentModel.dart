class DocumentModel {
  final String _id;
  final String name;
  final String filename;

  String get getName => name;

  String get getFilename => filename;

  String get getId => _id;

  DocumentModel(this._id, this.name, this.filename);

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(json["_id"], json["name"], json["filename"]);
  }
}
