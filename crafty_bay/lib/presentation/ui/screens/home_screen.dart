import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/widgets/category_item.dart';
import 'package:crafty_bay/widgets/center_circuler_progress_indicator.dart';
import 'package:crafty_bay/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/widgets/home/section_title.dart';
import 'package:crafty_bay/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              searchTextField,
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: GetBuilder<HomeBannerController>(
                  builder: (homeBannerController) {
                    return Visibility(
                      visible: homeBannerController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: BannerCarousel(
                        bannerList:
                            homeBannerController.bannerListModel.bannerList ??
                                [],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              populerProductList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              productList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount:
                categoryController.categoryListModel.categoryList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                category:
                    categoryController.categoryListModel.categoryList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get populerProductList {
    return SizedBox(
      height: 190,
      child: GetBuilder<PopularProductController>(
          builder: (popularProductController) {
        return Visibility(
          visible: popularProductController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount:
                popularProductController.productListModel.productList?.length ??
                    0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(
                product: popularProductController
                    .productListModel.productList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // return const ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () async {
            await Get.find<AuthController>().clearAuthData();
            Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(width: 8),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(width: 8),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
