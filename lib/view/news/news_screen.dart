import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/model/home/news_model.dart';

class NewsScreen extends StatelessWidget {
  final NewsModel news;
  const NewsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      news.image,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 5,
              child: Container(
                height: 70,
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back.svg',
                        color: Colors.white,
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                news.judul,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      LineIcon(
                        LineIcons.clock,
                        color: Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        news.waktuPublikasi,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LineIcon(
                        LineIcons.pencilRuler,
                        color: Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        news.namaPenulis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                news.content,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
