import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api_ecommerce_platform/controller/detail_product/detail_product_controller.dart';
import 'package:fakestore_api_ecommerce_platform/model/colors.dart';
import 'package:fakestore_api_ecommerce_platform/view/ui/circular_progress.dart';
import 'package:fakestore_api_ecommerce_platform/view/ui/fs_ratings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<DetailProductController>(
      init: DetailProductController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 280,
                      left: 10,
                      right: 10,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              _.product.title!,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  // S.of(context)!.price,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  '\$ ${_.product.price.toString()}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ratings",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${_.product.rating!.rate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                      ],
                                    ),
                                    FSRating(
                                      rating: _.product.rating!.rate!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Votes",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${_.product.rating!.count}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.thumb_up_alt_outlined,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () => _.goCardBuy(),
                                child: Text(
                                  "Buy",
                                  style: const TextStyle().copyWith(
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Descripción',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              _.product.description!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => _.goBackHome(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 40,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border_outlined,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                width: double.maxFinite,
                                height: 160.0,
                                fit: BoxFit.scaleDown,
                                imageUrl: _.product.image!,
                                placeholder: (context, url) => const SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: CircularProgress(
                                    width: 10,
                                    height: 10,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/sinimagen.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
