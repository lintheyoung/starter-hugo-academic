---
title: Pose estimation and point cloud perception
date: 2018-05-04T08:58:25.233Z
summary: Design and implementation of pose estimation and point cloud algorithms
draft: false
featured: true
authors:
  - Algorithm development(2020)
show_date: false
tags:
  - pose_estimation
# links:
#   - url: https://github.com/qiayuanliao/OpenMGSLS
#     name: Source
#     icon_pack: fab
#     icon: github
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# Pose estimation and point cloud perception
## Pose estimation

My undergraduate thesis focused on the estimation of object poses. I input RGB images and the 3D models of the detected objects, mapping the 2D image pixels to the 3D point cloud of the model. Based on this, I utilized PnP (Perspective-n-Point) and RANSAC algorithms to regress the pose and achieve object pose recognition. Additionally, this approach incorporated a deep learning-based refinement algorithm to further improve the pose accuracy based on the initial pose estimation from PnP. Experimental results demonstrated that, compared to other related works, establishing the mapping relationship between the 2D plane and 3D space enabled higher accuracy in pose estimation.

![](paper_1.png "Overall algorithm framework design")

![](paper_2.png "Creating a virtual dataset using randomly posed 3D models and COCO as the background")

![](paper_3.png "Dataset generation results")

![](paper_4.png "The principle of UV mapping")

![](paper_5.png "Mapping relationship between UV mapping and surface points (point cloud) of an object")

![](paper_7.png "Design of UV map generation network")

![](paper_6.png "Result of UV map generation")

![](paper_8.png "Comparison between UV map generation results and calibration images")

![](paper_9.png "Comparison between generated point cloud results and calibrated point cloud")

![](paper_10.png "The overall approach of using RANSAC+PnP for initial pose regression of objects")

![](paper_11.png "Design of a deep learning-based pose regression network")

![](paper_12.png "Pose recognition results")


## Point cloud perception
During my senior year, I primarily focused on point cloud perception in the laboratory at Jilin University. I accomplished the data format conversion from the Livox dataset to the KITTI dataset. 

![](livox_1.png "Data format conversion")

Additionally, I successfully trained and implemented the PointPillars model using the Livox dataset for forward inference. 

![](livox_2.png "Forward inference and recognition Result1")
![](livox_3.png "Forward inference and recognition Result2")

Through this experience, I gained knowledge of various methods for point cloud processing and became aware of their limitations. It also sparked my interest in exploring the fusion of point cloud and visual perception.

![](livox_4.png )
![](livox_5.png "There is significant room for improvement in using purely point cloud-based methods for model recognition.")