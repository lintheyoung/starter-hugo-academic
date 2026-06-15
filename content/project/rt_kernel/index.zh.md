---
title: 机器人团队项目（大一大二）
date: 2018-05-04T08:58:25.233Z
weight: 50
summary: 检测、定位与边缘视觉识别。
draft: false
featured: true
authors:
  - 嵌入式与算法开发（2018~2019）
show_date: false
tags:
  - robots_control
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# 校机器人队中的多个项目

从大一开始，我加入学校机器人队，并在多项比赛中持续提升自己的工程能力和算法能力。

## 灰度巡线板设计

我们发现机器人在室外或光照复杂环境中巡线时，容易受到外部光线，尤其是太阳光的干扰。因此，我希望设计一款能够抵抗外部光照干扰的灰度巡线板。

这块动态抗阳光干扰巡线板的设计思路包括：

- 使用差分方法动态关闭板载光源，先测量外部环境光强，再打开自发光源获取反射强度，两者相减后得到内部光源产生的真实反射强度，从而降低外部光照影响。
- 使用 Otsu 算法动态标定白线与黑色背景之间的阈值。
- 该项目已获得国家实用新型专利，并在队内多项机器人比赛中持续使用。

![](xunjiban.png "灰度巡线板设计")

巡线板在实际室外阳光干扰下的表现：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614342194&bvid=BV19h4y1s7Bo&cid=1149805523&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

## 小范围机器人定位的设计与实现

该项目实现了一套基于编码器电机、陀螺仪和激光测距传感器的机器人定位算法。系统使用 EKF（扩展卡尔曼滤波）融合编码器、陀螺仪和激光测距数据。通过融合编码器数据，即使激光传感器只有 10Hz 的工作频率，机器人仍能以 50Hz 的频率实现厘米级室内定位。

算法测试与可视化：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614263283&bvid=BV1Jh4y1s7oK&cid=1149806142&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

该定位算法在实际比赛中的应用：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=229312247&bvid=BV1Z8411f7Lm&cid=1149809346&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

## Jetson 与 YOLO

该项目基于 Jetson Nano 和 YOLOv4-tiny 设计道路车辆计数算法。

- 使用 TensorRT 在边缘设备上实现超过 18fps 的识别帧率，同时功耗低于 15W。
- 基于 Node-RED 框架设计数据可视化界面。

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=911830540&bvid=BV1aM4y1e7cf&cid=1149805640&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>
