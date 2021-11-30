import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/pages/filling_data/widgets/container_with_star.dart';
import 'package:flutter_application_1/pages/filling_data/widgets/input.dart';
import 'package:flutter_application_1/pages/plans_page_view/widgets/gradient_button.dart';
import 'package:flutter_application_1/pages/successfull_order/successfull_order_page.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_transition.dart';
import 'package:flutter_application_1/widgets/default_container.dart';
import 'package:swipe/swipe.dart';

class FillingData extends StatefulWidget {
  final int summaryPrice;
  final String currency;
  const FillingData({
    Key? key,
    required this.summaryPrice,
    required this.currency,
  }) : super(key: key);

  @override
  _FillingDataState createState() => _FillingDataState();
}

class _FillingDataState extends State<FillingData> {
  late final TextEditingController controllerCity;
  late final TextEditingController controllerStreet;
  late final TextEditingController controllerHome;
  late final TextEditingController controllerFlat;
  late final TextEditingController controllerComment;
  late final TextEditingController controllerNumber;

  @override
  void initState() {
    super.initState();
    controllerCity = TextEditingController();
    controllerStreet = TextEditingController();
    controllerHome = TextEditingController();
    controllerFlat = TextEditingController();
    controllerComment = TextEditingController();
    controllerNumber = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Swipe(
        onSwipeRight: () => Navigator.pop(context),
        child: Scaffold(
          backgroundColor: AppConfig.whiteColor,
          body: Column(
            children: [
              const CustomAppBar(isBackArrow: true),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),

                        /// Анимация
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 94),
                          child: Image.asset(
                            'lib/assets/gif/winning_cup.gif',
                          ),
                        ),
                        const SizedBox(height: 57),

                        /// Выбор города
                        DefaultContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Input(
                              width: width - 122,
                              hintText: 'Город',
                              controller: controllerCity,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),

                        /// Выбор улицы
                        DefaultContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Input(
                              width: width - 122,
                              hintText: 'Улица',
                              controller: controllerStreet,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),

                        /// Выбор дома и квартиры
                        Row(
                          children: [
                            DefaultContainer(
                              child: SizedBox(
                                width: (width - 110) / 2,
                                height: 42,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.center,
                                  controller: controllerHome,
                                  cursorColor: AppConfig.blueColor,
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 5.0),
                                    border: InputBorder.none,
                                    hintText: 'Дом',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: AppConfig.blackColor
                                          .withOpacity(0.15),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppConfig.blueColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ContainerWithStar(
                              isActive: controllerHome.text.isNotEmpty &&
                                      controllerFlat.text.isNotEmpty
                                  ? true
                                  : false,
                            ),
                            const SizedBox(width: 12),
                            DefaultContainer(
                              child: SizedBox(
                                width: (width - 110) / 2,
                                height: 42,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.center,
                                  controller: controllerFlat,
                                  cursorColor: AppConfig.blueColor,
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 5.0),
                                    border: InputBorder.none,
                                    hintText: 'Квартира',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: AppConfig.blackColor
                                          .withOpacity(0.15),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppConfig.blueColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 17),

                        /// Добавление комментария
                        DefaultContainer(
                          borderRadius: 8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 12, 12, 13),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width - 74,
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      controllerComment.text.isEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          'Волшебное место, где можно написать полезный ',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: AppConfig
                                                            .blackColor
                                                            .withOpacity(0.15),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: 'комментарий',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            AppConfig.blueColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          ' для мастера, важные детали, удобное время приема',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: AppConfig
                                                            .blackColor
                                                            .withOpacity(0.15),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      TextField(
                                        minLines: 3,
                                        maxLines: 3,
                                        scrollPadding:
                                            const EdgeInsets.only(bottom: 218),
                                        cursorColor: AppConfig.blueColor,
                                        controller: controllerComment,
                                        onChanged: (_) {
                                          setState(() {});
                                        },
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppConfig.blueColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),

                        /// Выбор номера телефона
                        DefaultContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Input(
                              textInputAction: TextInputAction.done,
                              width: width - 122,
                              hintText: 'Номер мобильного телефона',
                              controller: controllerNumber,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),

              /// Нижний блок [Градиент кнопка]
              Container(
                width: width,
                color: AppConfig.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 12),
                  child: GradientButton(
                    onTap: () async {
                      Navigator.of(context)
                          .push(CustomPageRoute(const SuccessFullOrderPage()));
                    },
                    startColor: AppConfig.stepsGradientStartThird,
                    endColor: AppConfig.stepsGradientEndThird,
                    richText: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Мастер за ',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppConfig.whiteColor.withOpacity(0.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '${widget.summaryPrice} ${widget.currency}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppConfig.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}