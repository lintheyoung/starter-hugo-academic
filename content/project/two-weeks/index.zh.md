---
title: 这两周在做的一些事情
date: 2026-06-15T00:00:00.000Z
weight: 5
summary: "围绕少视角动态 4DGS，记录从双手机同步采集、VGGT/GC-4DGS 魔改到虚拟机位补全的探索，同时整理同步拍摄 App 与机械臂工具链的阶段进展。"
draft: false
featured: true
authors:
  - 4DGS / 多机同步拍摄 / 机械臂探索
show_date: false
tags:
  - 4DGS
  - robotics
  - app
image:
  filename: featured.jpg
  focal_point: Center
  preview_only: true
---

## 少视角 4DGS：从 2 个手机到虚拟机位补全

### 目标：用尽可能少的设备构建尽可能好的 4D 效果

先看看结果，这个是我跑通的一个pipeline，目前是跑通阶段，还没有开始去优化，不过我感觉还有非常非常多可以优化获得更好效果的手段

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/dog2_hq1024_vggt4dgs_full294_fps30time_i35000_best_10s_moving_cam00_cam24_h264.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

实际的记录的场景是，我用两个手机的（两个手机摄像头型号都不一样，一个是iPhone12mini，一个是iPhone17）摄像头，架设在两边，然后中间在做机器狗的搬运动作；

![28e4d220deaaa086a2444af4e6929522](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/28e4d220deaaa086a2444af4e6929522.jpg)

视频如下，这两个手机是随意摆放的（不过中间还是要有一定的夹角，有相同记录的交叉区域），不知道手机的外参和内参，另外是手机端只设置录制时间+同步（这个由我自己开发的App实现嘿嘿，这个地方会仔细说下，最终我可以做到局域网下的手机可以同时的拍摄，帧误差在+-2ms以内)，不做对应的快门时间、曝光、白平衡的手动设置；

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/redpandacompress_rigcapture_mq9qklfv_d80e07_side_by_side_30fps.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### GC-4DGS + VGGT：先去掉标定依赖

我最开始就是直接基于[GC-4DGS](https://arxiv.org/abs/2511.23044)这个文章+代码，开始魔改，[GC-4DGS](https://arxiv.org/abs/2511.23044)这个文章核心思想就是用DeepAnthing2估计单帧的深度信息+三个不同视角的CAM（需要知道内参外参），去尽可能的实现少摄像头输入获得好的4DGS视频；我魔改的思路就是直接用VGGT把其中的DA2深度信息、多视角的MVS、需要相机的内参外参，这些信息全部都由VGGT提供了（因为这样子我就能随便架手机了，而且不挑手机参数），我先和原版的GC-4DGS跑了下对比，结果如下

| 方法                        | 输入来源                       | Point Cloud          | Depth Supervision | Iter | Test PSNR   | 结论                                   |
| --------------------------- | ------------------------------ | -------------------- | ----------------- | ---- | ----------- | -------------------------------------- |
| Original GC-4DGS MVS        | 官方标定                       | MVS/COLMAP           | 原始 MVS          | 6000 | **29.2501** | 当前最强参考线                         |
| VGGT pose only              | VGGT pose + 原始 intrinsics/PC | 原始 MVS PLY         | 原始 MVS          | 500  | 24.0516     | pose 替换会明显掉点                    |
| Early VGGT-only             | VGGT 全套                      | VGGT sparse / bad PC | VGGT depth        | 500  | 21.1792     | 点云覆盖不足导致失败                   |
| VGGT cameras + original PLY | VGGT pose/intrinsics           | 原始 MVS PLY         | 无 / 原始链路     | 500  | 25.0413     | 证明初始化点云很关键                   |
| VGGT dense q50              | VGGT 全套                      | VGGT dense q50       | 无 / 弱           | 500  | 25.3678     | 高置信点不一定最好                     |
| VGGT dense q20              | VGGT 全套                      | VGGT dense q20       | 无 / 弱           | 500  | **26.4874** | 覆盖更重要，500 iter 超过原始 baseline |
| VGGT q20 + t10 depth        | VGGT 全套                      | VGGT q20 t0 PC       | VGGT t10 depth    | 6000 | **28.0949** | 当前 VGGT 最佳，但仍落后原始 MVS       |
| VGGT 2cam                   | VGGT 全套                      | VGGT q20 t0 PC       | VGGT depth        | 500  | 24.2937     | 2cam 能跑，但对采集非常敏感            |
| dog2 2cam                   | VGGT 全套                      | VGGT t0 PC           | VGGT MVS          | 2000 | **16.9906** | 自采 2cam 当前仍较难                   |

在原版的flame_steak 3-view数据上，也就是从大概PSNR从29掉到了28，但是少去了需要确定的相机内参外参，这个是可以接受的事情，所以就直接用这个去开跑狗狗两个cam视频了，但是效果就是很差，如下

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/redpandacompress_vggt-4dgs-gen-raw.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### 2Cam 自采失败后的深度约束尝试

效果很差，所以我开始了各种尝试，在训练时候最大的问题就是训练的就是我发现其实VGGT其实已经可以获得了一个不错的点云效果，然后是否有可能是让高斯球球去更好的贴合这种点云轮廓呢，所以我去设置了每50就做一次深度约束，但是效果也其实没有好到哪里去；

### SplaTT3R 初始化：从点云初始化转向高斯初始化

然后开始思考是不是其实点云还是和高斯有很大的区别，从两帧可以获得点云，那是不是也可以类似两帧也能去获得对应的高斯云呢，我找到这个https://splatt3r.active.vision/ 项目，他的思路会很类似如下

```
现在 VGGT 的用法主要是：
VGGT depth
  → unproject 成点云
  → 给 GC-4DGS 初始化 Gaussian mean/color
  → scale/opacity/rotation 还是主要靠 GC-4DGS 后续优化
  
SplaTT3R 的思想更进一步：
两张图
  → 每个像素直接预测 Gaussian mean + scale + rotation + opacity + color
  
狗狗 2cam 里，初始化点云虽然有 288k/500k 点，但 Gaussian 的尺度、透明度、方向可能不适合两视角稀疏动态场景。我们可以考虑：
- VGGT 继续负责 pose/depth
- 但初始化 Gaussian 的 scale/opacity/pruning 参考 SplaTT3R 的思路,不要让 4DGS 从很粗糙的点云初始化慢慢自己长出来，而是给它更合理的初始 Gaussian 大小和 opacity。
```

然后开始测试实验，从最开始的2CAM生成点云，从点云去辅助高斯的生成，变成了直接2CAM直接生成点云，然后由2CAM生成的高斯初始化效果如下

![e2fdc12a-cbc7-4fc5-9ff0-7dde68494057](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/e2fdc12a-cbc7-4fc5-9ff0-7dde68494057.png)



| 数据集    | 输入来源                                                     | Point Cloud | Depth Supervision | Iter | Test PSNR   | 结论                                                         |
| --------- | ------------------------------------------------------------ | ----------- | ----------------- | ---- | ----------- | ------------------------------------------------------------ |
| dog2 2cam | VGGT 全套                                                    | VGGT t0 PC  | VGGT MVS          | 2000 | **16.9906** | 自采 2cam 当前仍较难                                         |
| dog2 2cam | 3-timepoint SplaTT3R init + identity 4D rotation + adjacent scaling_t + VGGT MVS depth w=0.002 | /           | /                 | 500  | 12.6429     | SplaTT3R 多时间点 init 这版在 dog2 上仍然不如 VGGT 点云 baseline |

效果还是很差，并且反而比直接用VGGT + 4DGS还更差了，并且远低于flame_steak 3个cam的PSNR

### 第一轮 insight：深度不能补齐视角缺失

所以我差不多在这个时候得到的insight就是，深度信息在早期非常的重要，但是深度信息其实对高斯来说没有办法去补充对于的视角缺失，而有好的视角对于的图片的增加可能影响70%的高斯效果；

### MoGe + VGGT：获得更细的点云和相机位姿

我在做VGGT的时候，就观察到多视角其实可以建立一个不错的还行的三维点云，然后我其实是可以从多个视角去看到的，这个我就在思考是不是可以从多个视角从点云，模拟一个确定外参的相机，从对应的角度去拍摄对应的图片呢，这个拍摄的图片去作为4DGS的输入呢？我从VGGT-omega 获得点云是这样子的：
![image-20260614235119248](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235119248.png)

![image-20260614235148021](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235148021.png)

![image-20260614235213121](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235213121.png)

他会有对应的深度信息，但是对于细节其实表现很差，不过VGGT好处就是可以获得相机的内参外参；然后在周四开组会的时候，听说了这个MoGe模型，我感觉这个细节就巨好，所以就直接马上理所应当的MoGe+VGGT两个直接对应的点云对齐一波试试看

![moge_dynamic_frames](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/moge_dynamic_frames.png)

![moge_vs_vggt](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/moge_vs_vggt.png)

![moge_vs_vggt_crop](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/moge_vs_vggt_crop.png)

![moge_fusion_aligned_t0](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/moge_fusion_aligned_t0.png)

而两个直接做好对齐后，其实点云来看就是最明显的，细节好了很多很多

![image-20260614235719929](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235719929.png)

![image-20260614235752971](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235752971.png)

![image-20260614235811600](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235811600.png)

![image-20260614235854629](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260614235854629.png)

### ViewCrafter：用 diffusion 补全中间视角

可以很清楚的看到就是此时的点云已经可以支撑我从不同的角度去看到对应的物体了，而点云之间的各种缺漏的位置，就非常理所应当的用diffusion去解决这个问题，我找到类似的这个项目https://github.com/Drexubery/ViewCrafter，然后开始魔改，最终我获得了类似如下的补全中间视角的图片（cam0 和 cam24是真实的，其他的全部是补充出来的）
![4f0b8e4c-05e2-4bcf-ae10-e13474a2242c](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/4f0b8e4c-05e2-4bcf-ae10-e13474a2242c.png)

取了中间的一个cam视角，有点奇怪哈哈，不过轮廓基本准确，这个后面就是很大的优化空间在这里

![ab51397a794d93c147d3c0a22e735c9f](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/ab51397a794d93c147d3c0a22e735c9f.png)

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/time_000120_diffusion_vc_hq704.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### 训练结果：2 个真实机位 + 5 个虚拟机位

然后开始使用，在两个手机记录的视频cam0和cam24，每个时刻都在两个相机之间插入对应的相机位姿所拍摄出来的对应的图（插入23个），然后我实际训练的时候只选了2个真实cam+5个virtual cam去重新的给到最开始的VGGT base的4DGS中，在train了35k之后，获得了对应的如下的效果；

![9ac08cc2-b00c-4d4a-981f-b375001ae5c4](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/9ac08cc2-b00c-4d4a-981f-b375001ae5c4.png)

![e94f7e96-9191-425b-93bd-0bf1d62e7b6a](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/e94f7e96-9191-425b-93bd-0bf1d62e7b6a.png)

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/dog2_hq1024_vggt4dgs_full294_fps30time_i35000_best_10s_moving_cam00_cam24_h264.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### 后续方向：从固定手机到多人动态采集

到此我感觉“如何用尽可能少的设备去构建一个尽可能好的4DGS视频”整体的pipeline我感觉大概有了一个方向，后面我感觉依然有非常多的方向可以去优化

- 更好的diffusion模型，类似直接微调qwen系列获得更好的图片质量效果，https://huggingface.co/spaces/multimodalart/qwen-image-multiple-angles-3d-camera
- 中间插入虚拟机位的方法，也可以从这种纯高斯的角度去思考，参考https://research.nvidia.com/labs/toronto-ai/difix3d/ 
- splatt3r作为初始化代替点云，我感觉依然有很多值得探索的空间；
- 是否可以从带有深度点云的出发，然后是不是有什么类似3D diffusion的方法，直接去补全点云，这样子我可以任意视角去获得对应的image，并且是有准确的内参外参的
- 对于动态的物体和静态的物体，是否可以分区域去构建不同的loss呢？
- 是否区分下实际的cam和virtual cam，方便对应的去设置不同的loss，可能也会有好的效果呢？
- 等等等等

另外是我个人感觉这个方向可以逐渐的从目前是：

- 两个固定的手机机位，被记录物体是动态的，获得对应的4D视频；

逐渐的过渡到到

- 是否可以是有个架子，上面固定手机（类似固定着），这样子手机之间的相对位姿确定，然后去记录动态物体，获得对应的4D视频？
  ![c5019bcbdd2e2c2025509c08ad20b80a](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/c5019bcbdd2e2c2025509c08ad20b80a.jpg)
- 是否就是三个人独立拿着三个手机，然后同时记录第四个人在走路，然后获得这个第四个人对应的4D视频，最近我也看到了开始有人在研究这个https://arxiv.org/pdf/2606.04593 ，我感觉这个真的太有趣了，有点类似比如有5～6个，围着一个火堆绕着圈在跳舞，然后所有人都举着手机在拍，最终大家会获得这个场景下涵盖所有人的4D视频，我感觉真他妈太酷了，并且这个事情从物理上其实就是可以实现的事情；
- 是否有可能其实很多演唱会，几乎所有人都会用自己的手机拍摄录制视频的，并且人与人之间的间距也是很小很密集，是否有可能每一次演唱会之后，都去把所有人视频收集下来，因为每个人的角度都不一样，其实就是从理论上可以去重建出来这个演唱会对应的4D视频；

我感觉有非常多的可以探索的方向，另外我还是会非常在乎这个技术的落地，所以可能我想探索的方向都会建立在具有落地可行性上；

## 多机同步拍摄 App

### 为什么不直接用 GoPro

有挺多的论文数据集会采用Go Pro Hero去做拍摄，从Hero7～Hero12都有，并且Hero有完整的开发SDK挺好做二次开发的，不过我感觉Hero最大问题也还是：

- Hero其实并不好去做时间同步，官方给出的对齐时间戳误差是在50ms～200ms，这个误差很大；
- 可以采用时间同步二维码，类似在每次开拍之前，所有相机盯着对应的会变动二维码去一起同步时间，不过这个因为相机也就120fps，香农定理决定了就是有8ms的误差区间；
- 二次开发还是需要实时的挂着一个电脑，才能去控制这个相机的矩阵；
- 缺乏Lidar，但是从之前的实验其实我感觉深度信息特别是绝对深度信息（带有能实际测量尺寸的）非常重要，特别是我猜如果是动态手机记录物体的4D视频会更加重要（因为本质就是在记录一个会动来动去的高斯云），但是GoPro真的很难提供，外接雷达也没有对应的硬触发同步，并且难做标定；

### iPhone 录制稳定性与传感器数据

所以在差不多考虑这些之后，我感觉还是可以用手机+局域网实现ntp授时，去实现高精度的同步时间轴上拍摄的App，所以在最早期直接做了个App，先看看iPhone的记录效果是否足够稳定

![9348784c99749d7c82fdb5f26c4761de](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/9348784c99749d7c82fdb5f26c4761de.jpg)

结论就是在iPhone12和iPhone17上都非常非常稳定，120fps就是120fps

![0b9649b647322b300bc806e888b10c00](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/0b9649b647322b300bc806e888b10c00.png)

并且这个我可以一起获得对应的IMU和音频数据（并且是和视频对齐的），这个其实对于后续如果是多个动态相机这个对于估计外参+时间同步会非常有用；

另外是我也测试iPhone12/17前置摄像头+对应的FaceId的lidar，得到的结论就是前置可以获得非常稳定的1080p 60fps视频录制+30fps的深度相机实时对齐RGB的深度图片，检测距离在5m以内（我感觉2m内噪点少且稳定）深度信息，我感觉这个可太有用了对动态的4DGS，后面我也打算从这个方向去做些探索看看；

![image-20260615005546906](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615005546906.png)

### NTP 授时与 rolling shutter 离线同步

然后在确定了iPhone其实可以很好的录制1080P 120FPS视频后，后面更加重要的就是如何去解决这个时间同步的问题，后面我的解决方案就是在局域网下，ntp授时方案，这个可以做到在+-2ms内；

同时我其实也探索了另外的一个新idea，是参考了这个paper（https://arxiv.org/pdf/1902.11084），这个paper的核心是

```
论文利用了 rolling shutter 的这个“缺陷”。闪光发生时，不同图像行对应不同时间，所以闪光亮带的位置可以反推出非常精细的时间点，用来同步多台相机。

它在做一件很具体但很有用的事：用视频里出现的闪光灯/突然光照变化，给多台 rolling shutter 相机做离线时间同步，并达到 0.3 到 0.5 毫秒级精度。这不是做目标检测，也不是做相机标定，而是解决“多路视频到底哪一帧、哪一行对应同一个真实时刻”的问题。论文摘要也明确说，它适用于任意数量 rolling shutter 相机，允许不同帧率、不同分辨率，甚至不需要视野重叠。
```

做了个小硬件测试了下，然后我用手机真的拍摄到了对应的这条带，这种方式可以去获得低于1ms的同步性能；

![297cb6f0854e69f9730703ca05391183](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/297cb6f0854e69f9730703ca05391183.jpg)

### 最终 App 方案

不过后面还是感觉实际应用过于麻烦，还是先用NTP授时即可，NTP授时方案在+-2ms误差内，后面有需要我也可以通过插帧去实现补全，所以最终实现的就是

- 在一个局域网下（同个WiFi下），使用App，所有的iPhone会通过NTP授时，所有手机的录制会共享一条时间轴，精度在+-2ms以内；
- 在App中用户可以自由的设置类似曝光时间、白平衡、ISO、对焦距离等等所有的参数；
- 所有手机，只要在一个手机的App中，按下对应的拍摄按钮，所有手机会一起开始拍摄；

![d24b96d1d02f51b57667b5eeb7bbc2dc](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/d24b96d1d02f51b57667b5eeb7bbc2dc.jpg)

App使用视频如下

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/App%E6%B5%8B%E8%AF%95.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### 数据集整理与导出

录制完成后直接导出配合下我做的这个https://github.com/lintheyoung/rigcapture-local-web web端的素材的整理导出，就可以很方便的获取可被使用的dataset

![image-20260615011849284](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615011849284.png)

![image-20260615011922091](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615011922091.png)

同步的结果如图

![image-20260615011455228](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615011455228.png)

之前采集抱着机械狗在动的两个cam视角，就是用这个App去拍摄的，现在已经上了testflight给周围的朋友测试，完善完善可能后面会上架和开源哈哈

![image-20260615011734420](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615011734420.png)

## 其他 4DGS 深度先验实验

搞定机械臂等机械臂加工后，大概花了一两天的时间，把一些经典的3DGS文章刷了一遍，然后把3DGS对应的高斯椭圆球究竟是什么，有了具象化的大概理解后，我个人还是比较习惯边做边学，就直接开跑代码了。因为我一直很想去做少视角的4D视频记录，所以基于GC-4DGS（https://arxiv.org/abs/2511.23044）文章的魔改和探索，把主体结构从DA2换为了DA3，把对于的MVS去换为了DA3支持的多个视角的图片做对于的深度估计部分，然后开跑后发现效果好像还不如DA2（不过也没差很多），**DA3 不是一接上就必然全面赢**。旧的 DA3 p02 在 10K final 上 PSNR 比 DA2 高，但 SSIM/LPIPS 更差，我感觉就是它可能把像素对齐做得更好，但结构/感知质量不一定更好。所以也去做了一些其他的实验，

| 阶段                      | 我们做了什么                                                 | 实验现象                                               | 得到的结论                                             |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ |
| 1. DA3 直接替换 MVS / DCC | 尝试用 DA3 替换原始 GC-4DGS 里的 MVS / DCC 几何先验          | 效果不好，没有稳定超过原始方法                         | MVS / DCC 仍然是重要的多视角几何骨架，不能被粗暴替换   |
| 2. DA3-Hybrid             | 保留 MVS / DCC，只用 DA3 替换 DA2 单帧深度，并用 DA3 confidence 做 soft weighting | PSNR 从 DA2 baseline 的 **29.2014** 提升到 **29.6045** | DA3 更适合作为深度先验增强，而不是替换整个几何模块     |
| 3. MDEDECAY               | 让深度 loss 在训练后期逐渐减弱                               | PSNR 不一定最高，但 SSIM / LPIPS 更稳                  | 深度先验前期有用，后期不能一直强                       |
| 4. RAP-Gate               | 根据 confidence、motion、edge 生成区域 trust map，不同区域使用不同深度权重 | RAP + MDEDECAY 的 LPIPS 达到 **0.1508**                | 不同区域不应该同等相信深度，动态/边界/反光区域要弱监督 |

------

**指标对比表：**

| 方法                | 核心变化                              | PSNR ↑      | SSIM ↑     | LPIPS ↓    | 主要现象     |
| ------------------- | ------------------------------------- | ----------- | ---------- | ---------- | ------------ |
| DA2 baseline        | 原始 DA2 深度先验                     | 29.2014     | 0.9287     | 0.1623     | 原始基线     |
| DA3-Hybrid          | DA3 替换 DA2 + confidence soft weight | **29.6045** | 0.9315     | 0.1609     | PSNR 最好    |
| DA3 + MDEDECAY      | 深度监督后期退场                      | 29.1906     | **0.9329** | 0.1510     | 结构更稳     |
| RAP-Gate + MDEDECAY | 区域自适应深度权重                    | 29.5257     | 0.9324     | **0.1508** | 感知质量最好 |

最终实验的insight就是：少视角动态 4DGS 中，深度先验不是越强越好。
更重要的是：**用更好的深度，并让它按时间和区域自适应发挥作用。**

## 机械臂与工具链

### 机械臂设计与 MuJoCo 仿真

因为拍摄项目有需求，设计做了一个机械臂：

![4256](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/4256.PNG)

完成了在mujoco的仿真运动控制：

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/rsrebot-all-joints-lift-extend-return.mp4" type="video/mp4">
  当前浏览器不支持直接播放该视频。
</video>

### DeDeUrdf 工具与开源文档

设计并开源了一个urdf的装配工具，因为市面上我发现真的都太难用了：

| 在线体验 | https://dedeurdf.vercel.app/            |
| -------- | --------------------------------------- |
| 开源仓库 | https://github.com/lintheyoung/DeDeUrdf |

![导入文件夹后的界面](https://rebotmono.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2F02-imported-folder.0--m-~58fk1_l.png&w=3840&q=75)

开源了这个新设计的机械臂，后面对于的软硬件算法控制都会全部开源更新上去

https://rebotmono.vercel.app/docs/robotics/rsrebot-mujoco-control

![image-20260615021644004](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/image-20260615021644004.png)

### CNC 装配与硬件测试

很多CNC件在最近陆陆续续到，开始装配和开始做软硬件的测试；

![4322](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/4322.JPG)

![d8c9e3bc2f2a980b4fab82ea622bc867](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/d8c9e3bc2f2a980b4fab82ea622bc867.jpg)
