import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailWeatherSkeleton extends StatelessWidget {
  const DetailWeatherSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: Color(0xFF3A3A3A),
        highlightColor: Color(0xFF545454),
        duration: Duration(milliseconds: 1200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
               Bone(
                  height: 36,
                  width: 36,
                 shape: BoxShape.circle,
                ),
                const SizedBox(width: 10,),
          Bone(
            height: 18,
            width: 40,
            borderRadius: BorderRadius.circular(12),
          ),
                const Spacer(),
                Bone(
                  height: 18,
                  width: 160,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
            const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
            Row(
              children: [
                Bone(
                  height: 36,
                  width: 36,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 10,),
                Bone(
                  height: 18,
                  width: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
                const Spacer(),
                Bone(
                  height: 18,
                  width: 160,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
            const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
            Row(
              children: [
                Bone(
                  height: 36,
                  width: 36,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 10,),
                Bone(
                  height: 18,
                  width: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
                const Spacer(),
                Bone(
                  height: 18,
                  width: 160,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
            const Divider(thickness: 0.5,indent: 20,endIndent: 20,height: 40,),
            Row(
              children: [
                Bone(
                  height: 36,
                  width: 36,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 10,),
                Bone(
                  height: 18,
                  width: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
                const Spacer(),
                Bone(
                  height: 18,
                  width: 160,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
            SizedBox(height: 140,),
          ],
        ),
      ),
    );
  }
}
