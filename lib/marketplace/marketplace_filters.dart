import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_box_shadow.dart';
import '../utils/utils.dart';
import 'marketplace_controller.dart';
import '../NFTs/NFTModel.dart';

class MarketplaceFilters extends StatefulWidget {
  const MarketplaceFilters({super.key});

  @override
  State<MarketplaceFilters> createState() => _MarketplaceFiltersState();
}

class _MarketplaceFiltersState extends State<MarketplaceFilters> {
  final _searchController = TextEditingController();
  final MarketplaceController marketplaceController = Get.put(MarketplaceController());

  void _clearFilters() {
   _searchController.clear();
   marketplaceController.clearFilters();
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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => _clearFilters(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(width: 1.5, color: Colors.white),
                    ),
                  ),
                  child: Text(
                    'Clear',
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ]
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'General',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextFormField(
              controller: _searchController,
              style: Theme.of(context).textTheme.bodyMedium,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            'Races',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child:
                Obx(() => CheckboxListTile(
                    title: Text(
                      'Eldmen',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Race.Eldmen],
                    onChanged: (newValue) => marketplaceController.updateFilter(Race.Eldmen, newValue!),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() => CheckboxListTile(
                      title: Text(
                        'Keenfolk',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Race.Keenfolk],
                      onChanged: (newValue) => marketplaceController.updateFilter(Race.Keenfolk, newValue!),
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Keldarin',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Race.Keldarin],
                      onChanged: (newValue) => marketplaceController.updateFilter(Race.Keldarin, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Grolls',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Race.Grolls],
                      onChanged: (newValue) => marketplaceController.updateFilter(Race.Grolls, newValue!),
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Dragonkin',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Race.Dragonkin],
                      onChanged: (newValue) => marketplaceController.updateFilter(Race.Dragonkin, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Class',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Unit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Unit],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Unit, newValue!),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Hero',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Hero],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Hero, newValue!),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Artifact',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Artifact],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Artifact, newValue!),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Doctrine',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Doctrine],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Doctrine, newValue!),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Technology',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Classs.Technology],
                      onChanged: (newValue) => marketplaceController.updateFilter(Classs.Technology, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Skin',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: Colors.white,
                      value: marketplaceController.filterObj[Classs.Skin],
                      onChanged: (newValue) => marketplaceController.updateFilter(Classs.Skin, newValue!),
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Pass',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Pass],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Pass, newValue!),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                  CheckboxListTile(
                    title: Text(
                      'Pack',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Theme.of(context).focusColor,
                    checkColor: Colors.white,
                    value: marketplaceController.filterObj[Classs.Pack],
                    onChanged: (newValue) => marketplaceController.updateFilter(Classs.Pack, newValue!),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Rarity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Common',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: getRarityColor(Rarity.Common),
                      value: marketplaceController.filterObj[Rarity.Common],
                      onChanged: (newValue) => marketplaceController.updateFilter(Rarity.Common, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Uncommon',
                        style: TextStyle(
                          fontSize: 14,
                          color: getRarityColor(Rarity.Uncommon),
                        )
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: getRarityColor(Rarity.Uncommon),
                      value: marketplaceController.filterObj[Rarity.Uncommon],
                      onChanged: (newValue) => marketplaceController.updateFilter(Rarity.Uncommon, newValue!),
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                        'Rare',
                        style: TextStyle(
                          fontSize: 14,
                          color: getRarityColor(Rarity.Rare),
                          )
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: getRarityColor(Rarity.Rare),
                      value: marketplaceController.filterObj[Rarity.Rare],
                      onChanged: (newValue) => marketplaceController.updateFilter(Rarity.Rare, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                          'Mythic',
                          style: TextStyle(
                            fontSize: 14,
                            color: getRarityColor(Rarity.Mythic),
                          )
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: getRarityColor(Rarity.Mythic),
                      value: marketplaceController.filterObj[Rarity.Mythic],
                      onChanged: (newValue) => marketplaceController.updateFilter(Rarity.Mythic, newValue!),
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Obx(() =>
                    CheckboxListTile(
                      title: Text(
                          'Fabled',
                          style: TextStyle(
                            fontSize: 14,
                            color: getRarityColor(Rarity.Fabled),
                          )
                      ),
                      activeColor: Theme.of(context).focusColor,
                      checkColor: getRarityColor(Rarity.Fabled),
                      value: marketplaceController.filterObj[Rarity.Fabled],
                      onChanged: (newValue) => marketplaceController.updateFilter(Rarity.Fabled, newValue!),
                    ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(),
              )
            ],
          ),
        ]
      )
    );
  }
}
