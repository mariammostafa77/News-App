import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/web_view/web_view_screen.dart';

Widget newsItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Card(
        //color: Colors.grey.withOpacity(0.2),

        elevation: 5.0,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: article['urlToImage'] ??
                          'https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg',
                      placeholder: (context, url) => Image.network(
                          'https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg'),
                      errorWidget: (context, url, error) => Image.network(
                          'https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg'),
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      article['title'] ?? 'NotFound',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            article['author'] == null ||
                                    article['author'].length > 20
                                ? 'Unknown'
                                : article['author'],

                            //article['author'] ??'Unknown',

                            maxLines: 2,

                            overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              article['publishedAt'] ?? 'Unknown',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
Widget articleList(newsList) => ListView.separated(
    itemBuilder: (context, index) => newsItem(newsList[index], context),
    separatorBuilder: (context, index) => const SizedBox(
          height: 10.0,
        ),
    itemCount: newsList.length);
void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
