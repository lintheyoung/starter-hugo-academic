---
title: 位姿估计与点云感知（本科毕业论文+吉大实验室）
date: 2018-05-04T08:58:25.233Z
weight: 30
summary: 位姿估计与点云算法的设计和实现。
draft: false
featured: true
authors:
  - 算法开发（2022）
show_date: false
tags:
  - pose_estimation
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# 位姿估计与点云感知（本科毕业论文+吉大实验室）
## 位姿估计

我的本科毕业论文聚焦于目标位姿估计。我以 RGB 图像和被检测目标的 3D 模型作为输入，将 2D 图像像素映射到模型表面的 3D 点云。在此基础上，我使用 PnP（Perspective-n-Point）和 RANSAC 算法回归目标位姿，实现目标位姿识别。同时，该方案还结合基于深度学习的 refinement 算法，在 PnP 得到初始位姿后进一步提升位姿精度。实验结果表明，与其他相关方法相比，建立 2D 平面与 3D 空间之间的映射关系，可以带来更高精度的位姿估计结果。

![](paper_1.png "整体算法框架设计")

![](paper_2.png "使用随机位姿 3D 模型和 COCO 背景生成虚拟数据集")

![](paper_3.png "数据集生成结果")

![](paper_4.png "UV 映射原理")

![](paper_5.png "UV 映射与物体表面点云之间的映射关系")

![](paper_7.png "UV map 生成网络设计")

![](paper_6.png "UV map 生成结果")

![](paper_8.png "UV map 生成结果与标定图像对比")

![](paper_9.png "生成点云结果与标定点云对比")

![](paper_10.png "使用 RANSAC+PnP 进行目标初始位姿回归的整体思路")

![](paper_11.png "基于深度学习的位姿回归网络设计")

![](paper_12.png "位姿识别结果")

## 点云感知

大四期间，我主要在吉林大学实验室开展点云感知相关工作。我完成了从 Livox 数据集到 KITTI 数据集的数据格式转换。

![](livox_1.png "数据格式转换")

此外，我基于 Livox 数据集成功训练并实现了 PointPillars 模型的前向推理。

![](livox_2.png "前向推理与识别结果 1")
![](livox_3.png "前向推理与识别结果 2")

通过这段经历，我系统了解了多种点云处理方法，也更清楚地认识到纯点云方法在实际目标识别中的局限性。这也激发了我继续探索点云与视觉感知融合的兴趣。

![](livox_4.png )
![](livox_5.png "纯点云方法在模型识别上仍有明显提升空间")
