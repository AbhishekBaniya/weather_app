import 'package:flutter/material.dart';

class AppParentWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? body, bottomNavigationBar;
  const AppParentWidget({super.key, this.appBar, this.resizeToAvoidBottomInset, this.body, this.bottomNavigationBar});
  //final parentKey = GlobalKey();

  @override
  Widget build(BuildContext context) => SafeArea(
    //key: parentKey,
    child: Scaffold(resizeToAvoidBottomInset: resizeToAvoidBottomInset, appBar: appBar, body: body, bottomNavigationBar: bottomNavigationBar,),
  );
}
