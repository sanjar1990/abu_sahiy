import 'package:abu_sahiy/view/category_six/widgets/models.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

const Duration _kScrollDuration = Duration(milliseconds: 200);
const EdgeInsetsGeometry _kTabMargin = EdgeInsets.symmetric(
  vertical: 5,
  horizontal: 8,
);
const EdgeInsetsGeometry _kTabPadding = EdgeInsets.symmetric(
  vertical: 5,
  horizontal: 12,
);

class ScrollToAnimateTab extends StatefulWidget {
  const ScrollToAnimateTab({
    required this.tabs,
    this.tabHeight = kToolbarHeight,
    this.tabAnimationDuration = _kScrollDuration,
    this.bodyAnimationDuration = _kScrollDuration,
    this.tabAnimationCurve = Curves.decelerate,
    this.bodyAnimationCurve = Curves.decelerate,
    this.backgroundColor = Colors.transparent,
    this.activeTabDecoration,
    this.inActiveTabDecoration,
    super.key,
  });

  final List<ScrollableList> tabs;
  final double tabHeight;
  final Duration? tabAnimationDuration;
  final Duration? bodyAnimationDuration;
  final Curve? tabAnimationCurve;
  final Curve? bodyAnimationCurve;
  final Color? backgroundColor;
  final TabDecoration? activeTabDecoration;
  final TabDecoration? inActiveTabDecoration;

  @override
  _ScrollToAnimateTabState createState() => _ScrollToAnimateTabState();
}

class _ScrollToAnimateTabState extends State<ScrollToAnimateTab> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  final ItemScrollController _bodyScrollController = ItemScrollController();
  late ItemPositionsListener _bodyPositionsListener;
  final ItemScrollController _tabScrollController = ItemScrollController();
  bool _isProgrammaticScroll = false;
  @override
  void initState() {
    super.initState();
    _bodyPositionsListener = ItemPositionsListener.create();
    _bodyPositionsListener.itemPositions.addListener(_onInnerViewScrolled);
  }

  late Decoration tabDecoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.tabHeight,
          color: widget.backgroundColor,
          child: ScrollablePositionedList.builder(
            itemCount: widget.tabs.length,
            scrollDirection: Axis.horizontal,
            itemScrollController: _tabScrollController,
            padding: const EdgeInsets.symmetric(vertical: 2.5),
            itemBuilder: (context, index) {
              return ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, i, __) {
                  final selected = index == i;
                  return GestureDetector(
                    onTap: () => _onTabPressed(index),
                    child: Container(
                      margin: _kTabMargin,
                      padding: _kTabPadding,
                      alignment: Alignment.center,
                      decoration: selected
                          ? widget.activeTabDecoration?.decoration
                          : widget.inActiveTabDecoration?.decoration,
                      child: _buildTab(index, selected),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemScrollController: _bodyScrollController,
            itemPositionsListener: _bodyPositionsListener,
            itemCount: widget.tabs.length,
            itemBuilder: (_, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: _kTabMargin.add(const EdgeInsets.all(5)),
                  child: _buildInnerTab(index),
                ),
                Flexible(
                  child: widget.tabs[index].body,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInnerTab(int index) {

    final tab = widget.tabs[index];
    return Builder(
      builder: (_) {
        if (tab.bodyLabelDecoration != null) {
          return tab.bodyLabelDecoration!;
        }
        return Text(
          tab.label.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        );
      },
    );
  }

  Widget _buildTab(int index, bool isSelected) {
    if (isSelected) {
      return Text(
        widget.tabs[index].label,
        style: widget.activeTabDecoration?.textStyle,
      );
    }
    return Text(
      widget.tabs[index].label,
      style: widget.inActiveTabDecoration?.textStyle,
    );
  }

  Future<void> _onInnerViewScrolled() async {
    if (_isProgrammaticScroll) return;

    final positions = _bodyPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    final firstIndex = positions.first.index;

    if (_index.value != firstIndex) {
      _isProgrammaticScroll = true;
      _index.value = firstIndex;

      double alignment = 0.3;
      if (firstIndex == 0) {
        alignment = 0.3;
      } else if (firstIndex == widget.tabs.length - 1) {
        alignment = 0.0;
      }
      // _isProgrammaticScroll = true;
      await _tabScrollController.scrollTo(
        index: firstIndex,
        alignment: alignment,
        duration: widget.tabAnimationDuration ?? _kScrollDuration,
        curve: widget.tabAnimationCurve ?? Curves.linear,
      );
      _isProgrammaticScroll = false;
    }
  }

  Future<void> _onTabPressed(int index) async {
    if (_index.value == index) return;
    double alignment = 0.3;
    if (index == 0) {
      alignment = 0.3; // Align to the start for the first tab
    } else if (index == widget.tabs.length - 1) {
      alignment = 0.0; // Align to the end for the last tab
    }
    _isProgrammaticScroll = true;
    await _tabScrollController.scrollTo(
      index: index,
      alignment: alignment,
      duration: widget.tabAnimationDuration ?? _kScrollDuration,
      curve: widget.tabAnimationCurve ?? Curves.linear,
    );

    await _bodyScrollController.scrollTo(
      index: index,
      duration: widget.bodyAnimationDuration ?? _kScrollDuration,
      curve: widget.bodyAnimationCurve ?? Curves.linear,
    );
    _index.value = index;
   await Future.delayed(Duration(milliseconds: 50));
    _isProgrammaticScroll = false;

  }

  @override
  void dispose() {
    _bodyPositionsListener.itemPositions.removeListener(_onInnerViewScrolled);
    return super.dispose();
  }
}
