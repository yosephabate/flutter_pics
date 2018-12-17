class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.title, this.url);

  //ImageModel.fromJSON(Map<String, dynamic> parsedJSON) {
  //  id = parsedJSON['id'];
  //  url = parsedJSON['url'];
  //  title = parsedJSON['title'];
  //}

  ImageModel.fromJSON(Map<String, dynamic> parsedJSON) 
    : id = parsedJSON['id'],
      url = parsedJSON['url'],
      title = parsedJSON['title'];
  
}