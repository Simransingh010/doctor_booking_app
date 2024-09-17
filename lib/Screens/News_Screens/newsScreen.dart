import 'package:flutter/material.dart';
import 'package:doctor_booking_app/Screens/News_Screens/news_article.dart';
import 'package:doctor_booking_app/apis/news_api.dart';
import 'package:doctor_booking_app/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:carousel_slider/carousel_slider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);
  static String get routeName => '/NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Articles>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = getArticle();
    print("DEBUG: initState called");
  }

  ImageProvider getImageProvider(String? url) {
    print("DEBUG: getImageProvider called with url: $url");
    if (url != null && url.startsWith('http')) {
      return NetworkImage(url);
    } else {
      return AssetImage('assets/Images/image4.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("DEBUG: build method called");
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder(
        future: _articlesFuture,
        builder: (context, snapshot) {
          print("DEBUG: FutureBuilder state: ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("DEBUG: Error in FutureBuilder: ${snapshot.error}");
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final articles = snapshot.data as List<Articles>;
            print("DEBUG: Number of articles: ${articles.length}");
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Health Insights',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    background: Image(
                      image: getImageProvider(articles.first.urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Featured Stories',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(height: 16.0),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                          items: articles.take(5).map((article) {
                            return Builder(
                              builder: (BuildContext context) {
                                return FeaturedStoryWidget(article: article);
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 24.0),
                        Text('Latest News',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print("DEBUG: Building NewsCard for index: $index");
                      return NewsCard(
                          article: articles[
                              index + 5]); // +5 to skip the featured stories
                    },
                    childCount: articles.length - 5,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class FeaturedStoryWidget extends StatelessWidget {
  final Articles article;

  const FeaturedStoryWidget({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DEBUG: Building FeaturedStoryWidget for article: ${article.title}");
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, NewsArticle.routeName,
          arguments: article),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: (context.findAncestorStateOfType<_NewsScreenState>()
                    as _NewsScreenState)
                .getImageProvider(article.urlToImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.0),
              Text(
                timeago.format(DateTime.parse(article.publishedAt ?? '')),
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final Articles article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DEBUG: Building NewsCard for article: ${article.title}");
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, NewsArticle.routeName,
            arguments: article),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: (context.findAncestorStateOfType<_NewsScreenState>()
                          as _NewsScreenState)
                      .getImageProvider(article.urlToImage),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      article.description ?? '',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      timeago.format(DateTime.parse(article.publishedAt ?? '')),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}