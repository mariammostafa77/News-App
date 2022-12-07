import 'package:flutter/material.dart';

Widget newsItem(dynamic article)=> Card(
  //color: Colors.grey.withOpacity(0.2),
  elevation: 5.0,
  child:   Column(
    children: [
      Image.network(article['urlToImage'] ?? 'https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg',
        width: double.infinity,
        height: 160.0,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 10.0,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(article['title'] ??'NotFound',
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 10.0,),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.person,color: Colors.black54,size: 20.0,),
                    const SizedBox(width: 5.0,),
                    Text( article['author']== null || article['author'].length > 20 ? 'Unknown': article['author'],
                      //article['author'] ??'Unknown',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.access_time_outlined,color: Colors.black54,size: 20.0,),
                      const SizedBox(width: 5.0,),
                      Text(article['publishedAt'] ??'Unknown',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
          ],
        ),
      )
    ],
  ),
);

Widget separatorWidget() => const SizedBox(height: 10.0,);