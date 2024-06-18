import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api_ecommerce_platform/controller/home/home_controller.dart';
import 'package:fakestore_api_ecommerce_platform/model/colors.dart';
import 'package:fakestore_api_ecommerce_platform/model/products/products.dart';
import 'package:fakestore_api_ecommerce_platform/model/utils.dart';
import 'package:fakestore_api_ecommerce_platform/view/ui/progress_hud.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.shopping_cart,
              color: AppColors.cardColor,
            ),
          ),
          appBar: AppBar(
            title: Image.asset(
              Utils().imageLogoAsset,
              width: 50,
              height: 50,
            ),
            actions: [
              IconButton(
                onPressed: () => _.onChangeAsc(),
                icon: _.isAsc
                    ? const Icon(
                        Icons.arrow_upward,
                      )
                    : const Icon(Icons.arrow_downward),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                  ),
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () => _.onCloseSession(),
                ),
              ],
            ),
          ),
          body: ProgressHUD(
            loading: _.isLoading,
            child: SafeArea(
              child: GetBuilder<HomeController>(
                id: 'ListProducts',
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildCard(_.products[index], context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(Product item, BuildContext context) {
    bool isLiked = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: item.image!,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/sinimagen.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title!,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${item.price.toString()}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: OutlinedButton(
                        onPressed: () => Get.find<HomeController>()
                            .goToDetailProduct(item.id.toString(), item),
                        child: const Text(
                          "Buy",
                          style: TextStyle(
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
