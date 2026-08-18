---
title: Pose estimation and point-cloud perception (undergraduate thesis + Jilin University lab)
date: 2018-05-04T08:58:25.233Z
weight: 30
summary: Design and implementation of pose-estimation and point-cloud algorithms.
draft: false
featured: true
authors:
  - Algorithm development (2022)
show_date: false
tags:
  - pose_estimation
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# Pose estimation and point-cloud perception (undergraduate thesis + Jilin University lab)

## Pose estimation

My undergraduate thesis focused on object pose estimation. Taking an RGB image and the 3D model of the detected object as input, I mapped 2D image pixels onto the 3D point cloud of the model's surface. From that correspondence I regressed the object's pose using PnP (Perspective-n-Point) and RANSAC. The approach also pairs with a deep-learning refinement step that improves accuracy further once PnP has produced an initial pose. The experiments showed that establishing an explicit mapping between the 2D plane and 3D space yields more accurate pose estimates than the comparable methods.

![](paper_1.png "Overall algorithm framework")

![](paper_2.png "Generating a synthetic dataset from randomly posed 3D models on COCO backgrounds")

![](paper_3.png "Dataset generation results")

![](paper_4.png "The principle of UV mapping")

![](paper_5.png "The mapping between the UV map and the object's surface point cloud")

![](paper_7.png "Design of the UV map generation network")

![](paper_6.png "UV map generation results")

![](paper_8.png "UV map generation results compared against the calibrated images")

![](paper_9.png "Generated point cloud compared against the calibrated point cloud")

![](paper_10.png "Overall approach: initial pose regression with RANSAC + PnP")

![](paper_11.png "Design of the deep-learning pose regression network")

![](paper_12.png "Pose recognition results")

## Point-cloud perception

In my senior year I worked mainly on point-cloud perception in the lab at Jilin University, starting with converting data from the Livox format into KITTI format.

![](livox_1.png "Data format conversion")

I then trained PointPillars on the Livox dataset and implemented forward inference.

![](livox_2.png "Forward inference and recognition, result 1")
![](livox_3.png "Forward inference and recognition, result 2")

The experience gave me a systematic view of point-cloud processing methods, and a much clearer sense of where purely point-cloud approaches fall short in real object recognition. That is what got me interested in fusing point-cloud and visual perception.

![](livox_4.png )
![](livox_5.png "Purely point-cloud methods still have obvious room for improvement in model recognition")
