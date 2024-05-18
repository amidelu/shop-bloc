import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/routes/app_routes.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';
import 'package:learning_shop_bloc/global_widgets/custom_appbar.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_state.dart';
import 'package:learning_shop_bloc/pages/home/home_controller.dart';
import 'package:learning_shop_bloc/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(_homeController.userProfile.avatar.toString()),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText('Home', color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(child: homePageText(_homeController.userProfile.name ?? '', topMargin: 3)),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: sliderView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.courseList.length,
                      (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.courseDetailsPage,
                            arguments: {
                              'id': state.courseList.elementAt(index).id,
                            },
                          );
                        },
                        child: courseGrid(state.courseList[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
