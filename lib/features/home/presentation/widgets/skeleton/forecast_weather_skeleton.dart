import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ForecastWeatherSkeleton extends StatelessWidget {
  const ForecastWeatherSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: Color(0xFF3A3A3A), // رنگ پایه اسکلت
        highlightColor: Color(0xFF959191), // رنگ درخشان شیمِر
        duration: Duration(milliseconds: 1200),
      ),
      child: SizedBox(
        height: 110,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Bone(
                  width: 44,
                  height: 18,
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(height: 6),
                Bone(width: 24, height: 18, shape: BoxShape.circle),
                const SizedBox(height: 6),
                Bone(
                  height: 22,
                  width: 34,
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(height: 4),
                Bone(
                  height: 22,
                  width: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 18),
          itemCount: 8,
        ),
      ),
    );
  }
}
