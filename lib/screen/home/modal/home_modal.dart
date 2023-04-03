class NewsModal{
  String? status;
  int? totalResults;
  List<Articles>? articleList=[];

  NewsModal({this.status, this.totalResults, this.articleList});

  void newsJ
}

class Articles {
  String? author, title, description, url, urlToImage, publishedAt, content;
  Source? source;

  Articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  });

  Articles articleJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    url = m1['url'];
    urlToImage = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];

    Source source = Source().sourceJson(m1['source']);

    Articles a1 = Articles(
        title: title,
        url: url,
        author: author,
        content: content,
        description: description,
        publishedAt: publishedAt,
        source: source,
        urlToImage: urlToImage);
    return a1;
  }
}

class Source {
  String? name;

  Source({this.name});

  Source sourceJson(Map m1) {
    name = m1['name'];

    Source s1 = Source(name: name);
    return s1;
  }
}
