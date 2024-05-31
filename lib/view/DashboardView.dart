import 'package:dashboard_design/Constants/ColorThemes.dart';
import 'package:dashboard_design/Constants/ImageAssets.dart';
import 'package:dashboard_design/Constants/Infos.dart';
import 'package:dashboard_design/Responsive%20Widget/ResponsiveWidget.dart';
import 'package:dashboard_design/view/widgets/MembersListWidget.dart';
import 'package:dashboard_design/view/widgets/OverViewGraphWidget.dart';
import 'package:dashboard_design/view/widgets/PlatformCapacityGraph.dart';
import 'package:dashboard_design/view/widgets/StackDataWidget.dart';
import 'package:dashboard_design/view/widgets/VehicleSchedule.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int drawerIndex = 0;
  bool isLightMode = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveWidget(
        mobile: Container(
          color: Colors.black,
          height: size.height,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14).copyWith(bottom: 10),
                      child: Image.asset(
                        logo2,
                        height: 45,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 08, vertical: 04),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: whiteColor.withOpacity(0.08),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLightMode = false;
                              });
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: !isLightMode
                                  ? yellowColor
                                  : Colors.transparent,
                              child: const Icon(
                                Icons.dark_mode,
                                size: 18,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 06),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLightMode = true;
                              });
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: isLightMode
                                  ? yellowColor
                                  : Colors.transparent,
                              child: const Icon(
                                Icons.light_mode,
                                size: 18,
                                color: whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      email,
                      width: 20,
                      color: whiteColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset(
                        setting,
                        width: 20,
                        color: whiteColor,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          bellIcon,
                          width: 20,
                          color: whiteColor,
                        ),
                        const Positioned(
                          top: 0,
                          right: -4,
                          child: CircleAvatar(
                            radius: 08,
                            backgroundColor: red,
                            child: Text(
                              '3',
                              style: TextStyle(color: whiteColor, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 20),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(profile1),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: ListTile(
                            title: Text(
                              'Dashboard',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: whiteColor,
                                      fontSize: 28,
                                      height: 2,
                                      fontWeight: FontWeight.w900),
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                  text: 'Today\'s daily overview -  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: whiteColor.withOpacity(0.4)),
                                  children: [
                                    TextSpan(
                                      text: 'April 23, 2024',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: whiteColor),
                                    )
                                  ]),
                            ),
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 12,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// stack data widget
                        const StackDataWidget(
                          axisCount: 2,
                          isMobile: true,
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///over view graph
                              const OverViewGraphWidget(
                                isMobile: true,
                              ),
                              // const SizedBox(height: 18),
                              SizedBox(
                                  height: 250,
                                  width: size.width,
                                  child: const PlatformCapacityGraph()),

                              /// schedule vehicles
                              SizedBox(
                                height: 200,
                                width: size.width,
                                child: const Align(
                                    alignment: Alignment.topCenter,
                                    child: VehicleSchedule()),
                              ),
                              const SizedBox(height: 20),
                              const MembersListWidget(),
                              const SafeArea(child: SizedBox(height: 18))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        tablet: Row(
          children: [
            /// Drawer
            buildDrawerWidget(size, context, true),

            /// Screen
            Expanded(
              child: Container(
                color: Colors.black,
                height: size.height,
                child: Column(
                  children: [
                    /// top app bar
                    buildTopBar(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 22),

                            /// stack data widget
                            const StackDataWidget(axisCount: 2),
                            const SizedBox(height: 22),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///over view graph
                                  const OverViewGraphWidget(),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: const [
                                      /// Platform Capacity Graph
                                      PlatformCapacityGraph(),
                                      SizedBox(width: 18),

                                      /// schedule vehicles
                                      VehicleSchedule(),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const MembersListWidget(isTablet: true),
                                  const SafeArea(child: SizedBox(height: 18))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        desktop: Row(
          children: [
            /// Drawer
            buildDrawerWidget(size, context, false),

            /// Screen
            Expanded(
              child: Container(
                color: Colors.black,
                height: size.height,
                child: Column(
                  children: [
                    /// top app bar
                    buildTopBar(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 22),

                            /// stack data widget
                            const StackDataWidget(),
                            const SizedBox(height: 22),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ///over view graph
                                        const OverViewGraphWidget(),
                                        const SizedBox(height: 18),
                                        Row(
                                          children: const [
                                            /// Platform Capacity Graph
                                            PlatformCapacityGraph(),
                                            SizedBox(width: 18),

                                            /// schedule vehicles
                                            VehicleSchedule(),
                                          ],
                                        ),
                                        const SafeArea(
                                            child: SizedBox(height: 18))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const Expanded(
                                      flex: 2, child: MembersListWidget())
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: whiteColor,
                      fontSize: 28,
                      height: 2,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: RichText(
                  text: TextSpan(
                      text: 'Today\'s daily overview -  ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: whiteColor.withOpacity(0.4)),
                      children: [
                        TextSpan(
                          text: 'April 23, 2024',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: whiteColor),
                        )
                      ]),
                ),
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 12,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 08, vertical: 04),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: whiteColor.withOpacity(0.08),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLightMode = false;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor:
                        !isLightMode ? yellowColor : Colors.transparent,
                    child: const Icon(
                      Icons.dark_mode,
                      size: 22,
                      color: whiteColor,
                    ),
                  ),
                ),
                const SizedBox(width: 08),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLightMode = true;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor:
                        isLightMode ? yellowColor : Colors.transparent,
                    child: const Icon(
                      Icons.light_mode,
                      size: 22,
                      color: whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            email,
            width: 24,
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              setting,
              width: 24,
              color: whiteColor,
            ),
          ),
          Stack(
            alignment: Alignment.centerRight,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                bellIcon,
                width: 24,
                color: whiteColor,
              ),
              const Positioned(
                top: 0,
                right: -4,
                child: CircleAvatar(
                  radius: 09,
                  backgroundColor: red,
                  child: Text(
                    '3',
                    style: TextStyle(color: whiteColor, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 20),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(profile1),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDrawerWidget(
    Size size,
    BuildContext context,
    bool isTablet,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isTablet ? 70 : 200,
      height: size.height,
      color: Colors.black87,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: isTablet
                  ? const EdgeInsets.all(14).copyWith(bottom: 20)
                  : const EdgeInsets.only(top: 12, bottom: 35),
              child: Image.asset(
                isTablet ? logo1 : logo2,
                height: 60,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drawerList.length,
              itemBuilder: (context, index) {
                var item = drawerList[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      drawerIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          item['image'],
                          width: 22,
                          color:
                              drawerIndex == index ? yellowColor : whiteColor,
                        ),
                        if (!isTablet) const SizedBox(width: 16),
                        if (!isTablet)
                          Text(
                            item['title'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: drawerIndex == index
                                        ? yellowColor
                                        : whiteColor),
                          ),
                        const Spacer(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: drawerIndex == index ? 30 : 0,
                          width: drawerIndex == index ? 2 : 0,
                          color: yellowColor,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(0.08),
              height: isTablet ? 26 : 60,
              padding: const EdgeInsets.only(left: 16),
              width: double.infinity,
              child: isTablet
                  ? Image.asset(
                      logOut,
                      width: 22,
                      color: whiteColor,
                    )
                  : Row(
                      children: [
                        Image.asset(
                          logOut,
                          width: 22,
                          color: whiteColor,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: whiteColor),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
