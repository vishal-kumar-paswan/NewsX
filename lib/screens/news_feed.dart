import 'package:flutter/material.dart';
import 'package:news_feed/models/news.dart';
import 'package:news_feed/services/fetch_news.dart';
import 'package:shimmer/shimmer.dart';

const cachedData = 'cached-data';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Future<NewsModel>? fetchNewsList;

  @override
  void initState() {
    setState(() {
      fetchNewsList = FetchNewsService.getNews();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
        title: const Text(
          'NewsX',
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder<NewsModel>(
          future: fetchNewsList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                child: ListView.builder(
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      elevation: 1.5,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              '${snapshot.data!.articles[index].source!.name}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              snapshot.data!.articles[index].title!,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.articles[index].description!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${snapshot.data!.articles[index].publishedAt!.difference(DateTime.now()).inHours.abs()} hours ago',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network(
                            snapshot.data!.articles[index].urlToImage!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        isThreeLine: true,
                      ),
                    );
                  }),
                ),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Failed to load current status'),
              );
            }
            return Center(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.redAccent,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    'Curating latest news for you :)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
