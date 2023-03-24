import 'package:calori_tracker/service/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../providers/theme_provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    Services services = Services();
    String link = "http://hd.wallpaperswide.com/thumbs/runner-t2.jpg";
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appTheme.colorScheme.secondary,
        title: const Text('Sport News'),
        actions: [
          IconButton(
            onPressed: () {
              newsProvider.getNews();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          newsProvider.newsList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: newsProvider.newsList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                      ).copyWith(top: 20),
                      child: Container(
                        height: w * 0.8 * 0.8,
                        width: w * 0.8,
                        decoration: BoxDecoration(
                          color: appTheme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: w * 0.8 * 0.8 * 0.6,
                              decoration: BoxDecoration(
                                // color: appTheme.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: w,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FadeInImage(
                                    image: NetworkImage(newsProvider
                                        .newsList[index].urlToImage
                                        .toString()),
                                    placeholder: const AssetImage(
                                        "assets/images/placeholder.png"),
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/placeholder.png',
                                          fit: BoxFit.fitWidth);
                                    },
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: w * 0.8 * 0.8 * 0.2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ).copyWith(bottom: 5),
                                child: Text(
                                  newsProvider.newsList[index].title.toString(),
                                  style: TextStyle(
                                      color: appTheme.colorScheme.onSecondary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(newsProvider
                                            .newsList[index].publishedAt
                                            .toString()),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Text(
                        "No News",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          newsProvider.getNews();
                        },
                        child: const Text("Refresh"),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
