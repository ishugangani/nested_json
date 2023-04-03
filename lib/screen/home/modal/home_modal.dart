class NewsModal{
  String? status;
  int? totalResults;
  List<Articles>? articleList=[];

  NewsModal({this.status, this.totalResults, this.articleList});

  NewsModal newsJson(Map m1)
  {
    status=m1['status'];
    totalResults=m1['totalResults'];

    List aList=m1['articles'];
    articleList = aList.map((e) => Articles().articleJson(e)).toList();
    NewsModal n1 = NewsModal(totalResults: totalResults,status: status ,articleList: articleList);
    return n1;
  }
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
  String? name,id;

  Source({this.id,this.name});

  Source sourceJson(Map m1) {
    id=m1['id'];
    name = m1['name'];

    Source s1 = Source(name: name,id: id);
    return s1;
  }
}
