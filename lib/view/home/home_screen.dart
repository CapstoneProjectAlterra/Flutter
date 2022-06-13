import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_booking/components/constants.dart';
import 'package:vaccine_booking/components/navigator_slide_transition.dart';
import 'package:vaccine_booking/view/news/news_screen.dart';
import 'package:vaccine_booking/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit == true) {
      Provider.of<HomeViewModel>(context, listen: false).getAllNews();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientHorizontal),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "Halo,",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Nama User!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: bannerVaksinasi(),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Berita hari ini",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: newsListView(homeViewModel),
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
    );
  }

  Widget bannerVaksinasi() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: const BoxDecoration(
        color: secondColorLow,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, top: defaultPadding),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ayo lakukan vaksinasi!",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      "Harap lengkapi data diri anda sebelum melakukan pemesanan.",
                      style: Theme.of(context).textTheme.bodyText2!),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: lengkapiDataButton(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              bottom: 12,
              child: Image.asset(
                'assets/images/vaccine2.png',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget newsListView(HomeViewModel viewModel) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: viewModel.newsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              NavigatorSlideTransition(
                child: NewsScreen(
                  news: viewModel.newsList[index],
                ),
                direction: AxisDirection.right,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(viewModel.newsList[index].image),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    viewModel.newsList[index].judul.length > 17
                        ? '${viewModel.newsList[index].judul.substring(0, 30)}...'
                        : viewModel.newsList[index].judul,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget lengkapiDataButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Lengkapi Data Diri",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
