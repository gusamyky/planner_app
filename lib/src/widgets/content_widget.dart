import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_routes.dart';
import 'package:planner_app/src/core/utils/constants.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    this.withSafeArea = true,
    this.withAppBar = false,
    this.appBarActions,
    this.withPadding = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onRefresh,
    this.body,
    this.children,
    this.bottomFloatActionButtons,
    this.physics,
  });

  final bool withSafeArea;
  final bool withAppBar;
  final ScrollPhysics? physics;
  final List<Widget>? appBarActions;
  final bool withPadding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final AsyncCallback? onRefresh;
  final Widget? body;
  final List<Widget>? children;
  final List<Widget>? bottomFloatActionButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: withAppBar
          ? AppBar(
              leading: BackButton(
                onPressed: () => context.router.canNavigateBack
                    ? context.router.back()
                    : context.router.pushNamed(AppRoutes.home),
              ),
              centerTitle: true,
              actions: appBarActions,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: bottomFloatActionButtons != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bottomFloatActionButtons!,
            )
          : null,
      body: SafeArea(
        top: withSafeArea,
        bottom: withSafeArea,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: body != null
              ? Padding(
                  padding: EdgeInsets.only(
                    top: Constants.appPadding,
                    left: withPadding ? Constants.appPadding : 0,
                    right: withPadding ? Constants.appPadding : 0,
                  ),
                  child: body,
                )
              : LayoutBuilder(
                  builder: (_, constraints) => SingleChildScrollView(
                    physics: physics,
                    padding: EdgeInsets.only(
                      top: Constants.appPadding,
                      left: withPadding ? Constants.appPadding : 0,
                      right: withPadding ? Constants.appPadding : 0,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        minWidth: constraints.maxWidth,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: mainAxisAlignment,
                          crossAxisAlignment: crossAxisAlignment,
                          children: children ?? <Widget>[],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
