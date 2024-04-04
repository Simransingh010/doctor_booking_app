import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking_app/Screens/News_Screens/news_article.dart';
import 'package:doctor_booking_app/apis/news_api.dart';
import 'package:doctor_booking_app/models/news_model.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);
  static String get routeName => '/NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

String formatPublishedAt(String publishedAt) {
  DateTime dateTime = DateTime.parse(publishedAt);
  return timeago.format(dateTime);
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Articles>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 41, 50, 140),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Health News',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 41, 50, 140),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Health News',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 41, 50, 140),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Health News',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: ListView(
              children: [
                CarouselWidget(articles: snapshot.data),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'Breaking News',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                NewsList(articles: snapshot.data),
              ],
            ),
          );
        }
      },
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<Articles>? articles;

  const CarouselWidget({Key? key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      child: CarouselSlider(
        items: articles!.map((article) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 20,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            article.urlToImage ??
                                'https://www.ledr.com/colours/black.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsArticle.routeName,
                            arguments: article,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    // left: 10,
                                  ),
                                  child: Text(
                                    article.title ?? ' No DATA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  article.content ?? ' No DATA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height * 0.55,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<Articles>? articles;

  const NewsList({
    Key? key,
    this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: CupertinoScrollbar(
        controller: FixedExtentScrollController(initialItem: 0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: articles!.length,
          itemBuilder: (context, index) {
            final article = articles![index];
            return ListTile(
              leading: ImageContainer(
                imageUrl: article.urlToImage ?? "Not Available",
                width: 80,
                height: 80,
              ),
              title: Text(
                article.title ?? "Not Available",
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                article.publishedAt != null
                    ? formatPublishedAt(article.publishedAt!)
                    : "Not Available",
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NewsArticle.routeName,
                  arguments: article,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
