import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/offers_controller.dart';
import 'package:pckode/controller/settings_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/imageassets.dart';
import 'package:pckode/core/localization/change_local.dart';
import 'package:pckode/view/widget/customappbar.dart';
import 'package:pckode/view/widget/language/custom_button_language.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pckode/core/constant/routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    LocaleController localecontroller = Get.put(LocaleController());
    OffersController offersController = Get.put(OffersController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              CustomAppBar(
                mycontroller: offersController.search!,
                titleAppBar: '45'.tr,
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
                onPressedSearch: () {
                  offersController.onSearchItems();
                },
                onChanged: (val) {
                  offersController.checkSearch(val);
                },
              ),

              // Container(
              //   height: Get.width / 3,
              //   color: AppColor.primaryColr,
              // ),
              //
              Positioned(
                  top: Get.width / 3.9,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage(AppImageAssets.avatar),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [


Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '69'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CustomButtonLanguageSettings(
              textButton: 'عربى',
              onPressed: () {
                localecontroller.changeLanguage("ar");
                //Get.toNamed(AppRoute.onboarding);
              },
            ),
            CustomButtonLanguageSettings(
              textButton: 'English',
              onPressed: () {
                localecontroller.changeLanguage("en");
                //Get.toNamed(AppRoute.onboarding);
              },
            ),
            ],
          )
          ],
        ),

                  // ListTile(
                  //   // onTap: (){},
                  //   title: Text('Disable Notifications'),
                  //   trailing: Switch(
                  //     onChanged: (val) {},
                  //     value: true,
                  //   ),
                  // ),


                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.orderspending);
                    },
                    title:  Text('63'.tr),
                    leading: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    leading: const Icon(Icons.archive_outlined),
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title:  Text('64'.tr),

                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title:  Text('65'.tr),
                    leading: const Icon(Icons.location_on_outlined),
                  ),
                  // ListTile(
                  //   onTap: () {},
                  //   title:  Text('66'.tr),
                  //   leading: const Icon(Icons.help_outline_rounded),
                  // ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse('tel:+0201123180988'));
                    },
                    title:  Text('67'.tr),
                    leading: const Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text('68'.tr),
                    leading: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
