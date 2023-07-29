import 'package:bitcoin_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:bitcoin_demo/infrastructure/providers/home_screen_provider/home_screen_provider.dart';
import 'package:bitcoin_demo/infrastructure/providers/provider_registration.dart';
import 'package:bitcoin_demo/ui/commons/errors/custom_error_widget.dart';
import 'package:bitcoin_demo/ui/commons/loading/loading_widget.dart';
import 'package:bitcoin_demo/ui/screens/home_screen/widgets/bit_coin_logo.dart';
import 'package:bitcoin_demo/ui/screens/home_screen/widgets/bit_coin_type_slider.dart';
import 'package:bitcoin_demo/ui/screens/home_screen/widgets/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WidgetRef ref;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeScreenProvider).getCurrency();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      body: Consumer(builder: (context, ref, child) {
        this.ref = ref;
        HomeScreenProvider provider = ref.watch(homeScreenProvider);

        if (provider.isLoading) {
          return const LoadingWidget();
        }

        if (provider.hasError) {
          return CustomErrorWidget(
            errorMessage: provider.errorMessage,
            onPressed: () {
              ref.read(homeScreenProvider).getCurrency();
            },
          );
        }

        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  const BitCoinLogo(),
                  CurrencyText(
                    price: "${provider.selectedCurrency?.rateFloat ?? 00000}",
                  ),
                  if (provider.currencies.isNotEmpty)
                    BitCoinTypeSlider(
                      currencies: provider.currencies,
                      onSelectedItemChanged: (int index) {
                        ref.read(homeScreenProvider).setCurrentCurrency(index);
                      },
                    ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
