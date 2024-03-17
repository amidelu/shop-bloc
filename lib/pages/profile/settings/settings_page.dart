import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/routes/app_routes.dart';
import 'package:learning_shop_bloc/common/values/constant.dart';
import 'package:learning_shop_bloc/global.dart';
import 'package:learning_shop_bloc/pages/profile/settings/widgets/settings_widget.dart';

import 'bloc/settings_bloc.dart';
import 'bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                settingsButton(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
