import 'package:flatten/controllers/apps/jobs/job_discover_controller.dart';
import 'package:flatten/images.dart';
import 'package:flatten/utils/mixins/ui_mixin.dart';
import 'package:flatten/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class JobDiscoverPage extends StatefulWidget {
  const JobDiscoverPage({Key? key}) : super(key: key);

  @override
  State<JobDiscoverPage> createState() => _JobDiscoverPageState();
}

class _JobDiscoverPageState extends State<JobDiscoverPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late DiscoverController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.titleMedium(
                      "Discover",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(name: "UI"),
                        FxBreadcrumbItem(name: "Discover", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(flexSpacing),
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxFlex(
                      contentPadding: false,
                      children: [
                        FxFlexItem(
                          sizes: "lg-4",
                          child: buildLeftBarMatchingJob(),
                        ),
                        FxFlexItem(
                          sizes: "lg-8",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                "Discovery Jobs",
                                fontWeight: 600,
                              ),
                              FxSpacing.height(8),
                              buildDiscoveryJobs(),
                              FxSpacing.height(36),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FxText.titleMedium(
                                    "Feature Jobs",
                                    fontWeight: 600,
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(8, 8),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    child: FxText.titleMedium(
                                      'See All',
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                              // FxSpacing.height(8),
                              buildFeatureJobs(),
                              FxSpacing.height(36),
                              FxFlex(
                                contentPadding: false,
                                children: [
                                  FxFlexItem(
                                    sizes: "lg-4",
                                    child: buildHotJobs(),
                                  ),
                                  FxFlexItem(
                                    sizes: "lg-8",
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: FxText.titleMedium(
                                                "Salary Trend",
                                                fontWeight: 600,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FxText.titleSmall("Sort by :"),
                                                FxSpacing.width(8),
                                                PopupMenuButton(
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return [
                                                      "Year",
                                                      "Month",
                                                      "Day",
                                                      "Hours"
                                                    ].map((behavior) {
                                                      return PopupMenuItem(
                                                        value: behavior,
                                                        height: 32,
                                                        child: FxText.bodySmall(
                                                          behavior.toString(),
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                          fontWeight: 600,
                                                        ),
                                                      );
                                                    }).toList();
                                                  },
                                                  onSelected:
                                                      controller.onSelectedTime,
                                                  color: theme.cardTheme.color,
                                                  child: Row(
                                                    children: <Widget>[
                                                      FxText.labelMedium(
                                                        controller.selectTime
                                                            .toString(),
                                                        color: theme.colorScheme
                                                            .onBackground,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 4),
                                                        child: Icon(
                                                          Icons
                                                              .expand_more_outlined,
                                                          size: 22,
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                FxSpacing.width(8),
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.download_outlined,
                                                      // color:
                                                      //     contentTheme.primary,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SfCartesianChart(
                                          primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                MajorGridLines(width: 0),
                                            axisLine: AxisLine(width: 0),
                                          ),
                                          primaryYAxis: CategoryAxis(
                                            majorGridLines:
                                                MajorGridLines(width: 0),
                                            axisLine: AxisLine(width: 0),
                                          ),
                                          tooltipBehavior:
                                              controller.tooltipBehavior,
                                          series: <ChartSeries>[
                                            SplineSeries<ChartData, String>(
                                              dataSource: controller.chartData,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildChip(String chipName) {
    return RawChip(
      label: FxText.bodyMedium(
        chipName,
      ),
      backgroundColor: contentTheme.primary.withAlpha(20),
      deleteIcon: Icon(Icons.add),
    );
  }

  Widget buildCardPills(String pillContent) {
    return FxContainer.none(
      borderRadiusAll: 16,
      padding: FxSpacing.xy(12, 4),
      color: contentTheme.light.withAlpha(180),
      child: Center(
        child: FxText.titleMedium(
          pillContent,
          fontSize: 14,
          fontWeight: 600,
          color: contentTheme.primary,
        ),
      ),
    );
  }

  Widget buildLeftBarMatchingJob() {
    return FxContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.titleMedium(
            "Find Matching Jobs",
            fontWeight: 600,
          ),
          FxSpacing.height(20),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: contentTheme.primary.withOpacity(0.08),
              prefixIcon: Icon(
                Icons.search,
                size: 18,
                color: contentTheme.primary,
              ),
              isDense: true,
              hintText: "Search Files",
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              contentPadding: FxSpacing.horizontal(20),
            ),
          ),
          FxSpacing.height(20),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              buildChip("Google"),
              buildChip("Facebook"),
              buildChip("Apple"),
              buildChip("Amazon"),
              buildChip("Twitter"),
            ],
          ),
          Divider(
            height: 36,
          ),
          FxText.labelLarge(
            "Salary Range",
            muted: true,
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            "The Average listing Salary is \$90,000",
          ),
          FxSpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.bodyLarge(
                "\$${controller.rangeSlider.start.toString()}",
                fontWeight: 600,
              ),
              FxText.bodyLarge(
                "\$${controller.rangeSlider.end.toString()}",
                fontWeight: 600,
              ),
            ],
          ),
          RangeSlider(
            min: 10000,
            max: 120000,
            divisions: 10,
            labels: RangeLabels(controller.rangeSlider.start.floor().toString(),
                controller.rangeSlider.end.floor().toString()),
            values: controller.rangeSlider,
            onChanged: controller.onChangeRangeSlider,
            activeColor: theme.sliderTheme.activeTrackColor,
            inactiveColor: theme.sliderTheme.inactiveTrackColor,
          ),
          FxSpacing.height(12),
          FxText.labelLarge(
            "Select Experience",
            muted: true,
          ),
          FxSpacing.height(8),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return ["Beginner", "Intermediate", "Expert"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 28,
                  child: FxText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            onSelected: controller.onSelectedExperience,
            color: theme.cardTheme.color,
            child: FxContainer.bordered(
              padding: FxSpacing.xy(12, 8),
              child: Row(
                children: <Widget>[
                  FxText.labelMedium(
                    controller.selectExperience.toString(),
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ),
          ),
          FxSpacing.height(20),
          FxText.labelLarge(
            "Select Location",
            muted: true,
          ),
          FxSpacing.height(8),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return ["Mumbai", "Tokyo", "San Francisco"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 28,
                  child: FxText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            onSelected: controller.onSelectedLocation,
            color: theme.cardTheme.color,
            child: FxContainer.bordered(
              padding: FxSpacing.xy(12, 8),
              child: Row(
                children: <Widget>[
                  FxText.labelMedium(
                    controller.selectLocation.toString(),
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 36,
          ),
          FxText.labelLarge(
            "Job Types",
            muted: true,
          ),
          FxSpacing.height(8),
          Wrap(
            children: [
              FxButton(
                onPressed: () {
                  setState(() {
                    controller.onSelected;
                  });
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                borderColor: contentTheme.primary,
                backgroundColor: controller.selected == true
                    ? contentTheme.onPrimary
                    : contentTheme.primary,
                splashColor: contentTheme.primary.withOpacity(0.2),
                borderRadiusAll: 20,
                child: FxText.bodySmall('Full-Time', color: contentTheme.light),
              ),
              FxSpacing.width(8),
              FxButton(
                onPressed: () {
                  setState(() {
                    controller.isPartTime = !controller.isPartTime;
                  });
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                borderColor: contentTheme.primary,
                backgroundColor: controller.isPartTime
                    ? contentTheme.info.withOpacity(0.12)
                    : contentTheme.secondary.withAlpha(10),
                splashColor: contentTheme.primary.withOpacity(0.2),
                borderRadiusAll: 20,
                child: FxText.bodySmall(
                  'Part-Time',
                  color: controller.isPartTime
                      ? contentTheme.info
                      : contentTheme.secondary,
                ),
              ),
              FxSpacing.width(8),
              FxButton(
                onPressed: () {
                  setState(() {
                    controller.isMobile = !controller.isMobile;
                  });
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                borderColor: contentTheme.primary,
                backgroundColor: controller.isMobile
                    ? contentTheme.info.withOpacity(0.12)
                    : contentTheme.secondary.withAlpha(10),
                splashColor: contentTheme.primary.withOpacity(0.2),
                borderRadiusAll: 20,
                child: FxText.bodySmall(
                  'Mobile',
                  color: controller.isMobile
                      ? contentTheme.info
                      : contentTheme.secondary,
                ),
              ),
              FxSpacing.width(8),
              FxButton(
                onPressed: () {
                  setState(() {
                    controller.isContract = !controller.isContract;
                  });
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                borderColor: contentTheme.primary,
                backgroundColor: controller.isContract
                    ? contentTheme.info.withOpacity(0.12)
                    : contentTheme.secondary.withAlpha(10),
                splashColor: contentTheme.primary.withOpacity(0.2),
                borderRadiusAll: 20,
                child: FxText.bodySmall(
                  'Contract',
                  color: controller.isContract
                      ? contentTheme.info
                      : contentTheme.secondary,
                ),
              ),
            ],
          ),
          FxSpacing.height(20),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.blueGrey,
                  contentTheme.primary,
                  contentTheme.primary.withAlpha(200),
                  Colors.blueGrey
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Padding(
              padding: FxSpacing.all(flexSpacing / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.workspace_premium_outlined,
                    size: 30,
                    color: contentTheme.onPrimary,
                  ),
                  FxSpacing.width(12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.titleMedium(
                          "Upgrade To Pro",
                          fontWeight: 600,
                          color: contentTheme.onPrimary,
                        ),
                        FxText.bodyLarge(
                          "For premium Benefits",
                          color: contentTheme.onPrimary,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  FxText.bodyMedium(
                    "Upgrade",
                    color: contentTheme.onPrimary,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDiscoveryJobs() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        itemCount: controller.discover.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxContainer(
                height: 170,
                width: 180,
                borderRadiusAll: 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxContainer.none(
                        borderRadiusAll: 26,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          Images.avatars[index % Images.portraitImages.length],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
                    FxText.titleMedium(
                      controller.discover[index].jobTitle,
                      fontWeight: 600,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FxText.titleMedium(
                      controller.discover[index].appName,
                      fontWeight: 600,
                      muted: true,
                    ),
                    FxSpacing.height(4),
                    FxText.bodyMedium("\$${controller.discover[index].price}/y")
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget buildFeatureJobs() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.discover.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.blueGrey,
                      contentTheme.primary,
                      contentTheme.primary.withAlpha(200),
                      Colors.blueGrey
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Padding(
                  padding: FxSpacing.xy(flexSpacing / 1.5, flexSpacing / 1.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FxContainer.none(
                            borderRadiusAll: 8,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.avatars[
                                  index % Images.portraitImages.length],
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          FxSpacing.width(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FxText.titleMedium(
                                  controller.discover[index].jobTitle,
                                  fontWeight: 600,
                                  fontSize: 16,
                                  color: contentTheme.onPrimary,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                FxText.titleMedium(
                                  controller.discover[index].appName,
                                  color: contentTheme.onPrimary,
                                  muted: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCardPills("IT"),
                          buildCardPills("Full-Time"),
                          buildCardPills("Junior"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxText.bodyMedium(
                            "\$${controller.discover[index].price}/Year",
                            color: contentTheme.onPrimary,
                          ),
                          FxText.bodyMedium(
                            controller.discover[index].country,
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget buildHotJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.titleMedium(
          "Hot Jobs",
          fontWeight: 600,
        ),
        FxSpacing.height(16),
        SizedBox(
          height: 300,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.discover.length,
            itemBuilder: (context, index) {
              return FxContainer.none(
                borderRadiusAll: 16,
                paddingAll: 16,
                child: Row(
                  children: [
                    FxContainer.none(
                      borderRadiusAll: 26,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        Images.avatars[index % Images.portraitImages.length],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyMedium(
                            controller.discover[index].jobTitle,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.bodyMedium(
                            controller.discover[index].appName,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FxText.bodyMedium(
                          "\$${controller.discover[index].price}/y",
                          fontWeight: 600,
                        ),
                        FxSpacing.height(4),
                        FxText.bodyMedium(
                          controller.discover[index].country,
                          fontSize: 12,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          ),
        )
      ],
    );
  }
}
