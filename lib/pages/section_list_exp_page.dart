import 'package:flutter/material.dart';

class ExtraInfoBoxConstraints<T> extends BoxConstraints {

  ExtraInfoBoxConstraints(this.extra, BoxConstraints constraints) : super(
      minHeight: constraints.minHeight,
      maxHeight: constraints.maxHeight,
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth);

  final T extra;

  BoxConstraints get constraints => copyWith();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtraInfoBoxConstraints && super == other && other.extra == extra;
  }

  @override
  int get hashCode => hashValues(super.hashCode, extra);

}

typedef SliverPersistentHeaderToBoxBuilder = Widget Function(BuildContext context, double maxExtent, bool fixed);

class SliverPersistentHeaderToBox extends StatelessWidget {

  SliverPersistentHeaderToBox({Key? key, required Widget child})
      : builder = ((a, b, c) => child),
        super(key: key);

  const SliverPersistentHeaderToBox.builder({Key? key, required this.builder})
      : super(key: key);

  final SliverPersistentHeaderToBoxBuilder builder;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeaderToBox(
        child: LayoutBuilder(builder: (context, constraints) {
          return builder(context, constraints.maxHeight,
              (constraints as ExtraInfoBoxConstraints<bool>).extra);
        }));
  }
}

class SectionListExpPage extends StatelessWidget {
  const SectionListExpPage({Key? key}) : super(key: key);

  Widget buildHeader() {
    return
  }

  Widget buildSliverList([int count = 10]) {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(title: Text('$index'));
        }, childCount: count), itemExtent: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            title: Text('Section List'),
            expandedHeight: 250,
          ),
          buildSliverList()
        ],
      ),
    );
  }
}