---
title: Robotics Studio (2022–present)
date: 2018-05-04T08:58:25.233Z
weight: 20
summary: Started in 2022 from a small room in Guangzhou — designing competition robots for schools, delivering them in small batches, and productizing the core modules along the way.
draft: false
featured: true
authors:
  - End-to-end robot solution design and productization (2022–present)
show_date: false
tags:
  - studio
aliases:
  - /en/project/rm_controls/
image:
  filename: featured.jpg
  focal_point: Top
  preview_only: true
---

## How the studio started: a small room after graduate admission

### Why a robotics studio

After being recommended for graduate admission in my senior year in 2022, my plan was to intern as a point-cloud algorithm engineer at Hesai in Shanghai. The Shanghai lockdown made an on-site internship impossible, so I tried running a robotics studio instead: I rented a small room near campus and started by designing competition-robot hardware, writing code examples and running training sessions — supplying middle and high schools with robotics competition equipment and complete solutions.

### What schools actually needed

It began by accident, but it turned into real delivery work very quickly. Many schools wanted to compete but had no way to design hardware and system solutions from scratch. What we did was read the competition rules, design hardware that could actually be built to them, and ship it with matching software examples and training — so that after purchasing, a school could keep debugging, practicing and competing on its own.

![Early studio space in Guangzhou](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/gz_0.JPG)

*The early Guangzhou studio, in a village near the university — from one person at the start to six at its largest.*

![Design, assembly and shipping at the studio](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/gz_1.JPG)

*Design, small-batch production, packing and shipping.*

## The Guangzhou years: competition hardware and small-batch delivery

### Equipment design, code examples, on-site training

The studio's core work was competition-equipment design, small-batch manufacturing, code-example development, on-site training at schools and after-sales support. Beyond making a robot that complied with the rules, the harder requirement was lowering the barrier for teachers and students — the equipment had to run reliably in real classrooms and real competitions.

![Designing equipment and training at schools 1](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/px_0.JPG)

![Designing equipment and training at schools 2](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/px_1.JPG)

*Designing the equipment, then going to schools to run the training.*

### Competition equipment, 2022–2024

![Guangzhou studio competition equipment 1](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/cc_0.JPG)

![Guangzhou studio competition equipment 2](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/cc_1.JPG)

![Guangzhou studio competition equipment 3](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/cc_2.JPG)

![Guangzhou studio competition equipment 4](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/cc_3.JPG)

![Guangzhou studio competition equipment 5](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/cc_4.JPG)

*Several categories of competition equipment designed at the Guangzhou studio between 2022 and 2024.*

### From 500 units to national-level events

Between 2022 and 2024 — under two years — the studio shipped more than 500 units, and the robots built on that equipment took top awards across a range of provincial and national events. After 2024 we deliberately cut back the number of scattered competitions and moved toward national events with larger volumes that were worth investing in long term, while progressively productizing the sensors, controllers and algorithm tools we had accumulated.

![Foshan studio 1](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/fs_0.JPG)

![Foshan studio 2](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/fs_1.JPG)

*The studio after moving to Foshan, geared toward higher-volume delivery for national competitions.*

### 2026 competition equipment

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/2026B%E7%B1%BB%E6%9C%BA%E5%99%A8%E4%BA%BA.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<span id="products"></span>

## Productization: turning competition modules into reusable products

In its later phase the studio began redesigning the sensors, controllers, vision-recognition and auto-labeling tools it had been using internally into products it could sell. The goal was not one-off competition hardware: it was to consolidate the modules that had been validated over and over, raise reuse efficiency, and smooth out the business swings that come with competition seasons.

<span id="dedeimu"></span>

### DeDeIMU: high-performance 6-axis IMU

![DeDeIMU](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/DeDeIMU.JPG)

DeDeIMU is a redesigned high-performance 6-axis IMU module, optimized for accuracy, stability and low drift — yaw-axis stability in particular.

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/DeDeIMU-2024.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/DeDeIMU-2025.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<span id="dedeyolo"></span>

### DeDeYOLO: low-cost, low-power vision camera

![DeDeYOLO](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/DeDeYOLO.JPG)

DeDeYOLO is a low-cost, low-power YOLO vision-recognition camera. It runs a pruned and modified YOLOv3 model at roughly 10 FPS on a small edge device, and is used mainly for object recognition and detection in robotics competitions.

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/DeDeYOLO.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/DeDeYOLOV2.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<span id="video2tag"></span>

### Video2Tag: automated YOLO labeling platform

![Video2Tag automated labeling platform](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/vide_2_tag_hufe521340ef6d882cf9448f6f1dfe7af8_539425_1200x1200_fit_q75_h2_lanczos_3.webp)

Video2Tag is a web-based auto-labeling tool for building YOLO datasets. It cuts the data-preparation cost that precedes vision-model training and speeds up the annotate-and-iterate loop.

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/video2tag.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

<span id="dedemotor"></span>

### DeDeMotor: motor driver and motion-control module

![DeDeMotor](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/DeDeMotor.JPG)

DeDeMotor is a highly integrated motor-driver and motion-control module supporting ROS, Wi-Fi, BLE and 5A high-power motors. The motion-control algorithms are integrated on the driver itself, so the user only sets the chassis type and issues application-level commands to get stable, high-precision chassis control.

<video controls playsinline preload="metadata" style="width: 100%; border-radius: 8px; margin: 0.75rem 0 1.25rem;">
  <source src="https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dy_cv/EKF%E5%BA%95%E7%9B%98.mp4" type="video/mp4">
  Your browser cannot play this video.
</video>

### FastLIVO2: open hardware and multi-device synchronization

![FastLIVO2 multi-device synchronizer design](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/Fastlivo2_0.JPG)

*Synchronizer design supporting multiple devices.*

![FastLIVO2 handheld device hardware design](https://pub-6c1e280a27614b05891bfd818585735e.r2.dev/dedeblog/2026/06/Fastlivo2_1.JPG)

*Open-source handheld hardware design, supporting stereo fisheye and the FastLIVO2 device setup.*

## Where it landed: a stable business, and the next startup

After the move to Foshan, the studio shifted from "cover more competitions" to "do a few high-volume events really well, and productize the core modules." That made it a business with steady cash flow and reasonably bounded time demands — but it was a good *business* rather than a *startup* that could scale quickly.

Around 2024 I came to see that boundary clearly: either find a new direction better suited to growing large, or go back to school and finish the graduate degree. So once the studio was running stably, I started looking for a new venture — and from 2024 to 2026 committed to the Pest Control direction, still working on the same question of how to build a more scalable startup at the intersection of technology, product and market.
