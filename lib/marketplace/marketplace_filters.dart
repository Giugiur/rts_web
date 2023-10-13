import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_box_shadow.dart';
import '../utils/utils.dart';
import 'marketplace_controller.dart';

class MarketplaceFilters extends StatefulWidget {
  const MarketplaceFilters({super.key});

  @override
  State<MarketplaceFilters> createState() => _MarketplaceFiltersState();
}

class _MarketplaceFiltersState extends State<MarketplaceFilters> {
  final _searchController = TextEditingController();
  final MarketplaceController marketplaceController = MarketplaceController();

  void _clearFilters() {
   _searchController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: isSmallScreen(context) ?
        circularGradientDecoration :
        BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            CustomBoxShadow(
                color: Colors.black26,
                blurRadius: 1,
                blurStyle: BlurStyle.outer
            )
          ],
        ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(40.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 25,
                child: Text('Clear')
              ),
            ]
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'General',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextFormField(
              controller: _searchController,
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: (value) => marketplaceController.updateFilter('searchFilter', value),
              decoration: InputDecoration(
                isDense: Theme.of(context).inputDecorationTheme.isDense,
                prefixIconConstraints: const BoxConstraints(minWidth: 35, maxHeight: 35),
                hintText: 'Search asset name',
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
              ),
            ),
          ),
        ]
      )
    );
  }
}
