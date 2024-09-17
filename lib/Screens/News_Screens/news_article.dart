import 'package:doctor_booking_app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsArticle extends StatelessWidget {
  const NewsArticle({Key? key}) : super(key: key);

  static String get routeName => '/Article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        elevation: 0,
        title: Text(
          'The Daily Health',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage ??
                      'https://via.placeholder.com/400x200?text=No+Image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.brown[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    article.title ?? 'No Title',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16, color: Colors.brown[700]),
                      SizedBox(width: 8),
                      Text(
                        'By ${article.author ?? 'Unknown'}',
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.brown[700],
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.brown[700]),
                      SizedBox(width: 8),
                      Text(
                        article.publishedAt != null
                            ? timeago
                                .format(DateTime.parse(article.publishedAt!))
                            : 'Unknown',
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.brown[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    article.content ?? 'No content available',
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(color: Colors.brown[300], thickness: 1),
                  SizedBox(height: 16),
                  Text(
                    'Related Images',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Assuming 3 related images
                      itemBuilder: (context, index) {
                        return Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(article.urlToImage ??
                                  'https://via.placeholder.com/160x120?text=Related+Image'),
                              fit: BoxFit.cover,
                            ),
                            border:
                                Border.all(color: Colors.brown[300]!, width: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
