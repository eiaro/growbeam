---
title: "Chapter 2 - Background and Motivation"
weight: 30
---

This section provides context for the project, including the motivation and goals behind its creation.

## Background

In most cases, building your own hardware ends up being more expensive, time-consuming, and less polished than buying a commercial product. As many makers and engineers have put it: *"You don't build your own tool because it's cheaper — you build it because it doesn't exist yet, or because you want to learn."*

Even veteran creator Ben Eater once said in a Q&A, *“Sure, I could just buy it. But where’s the fun in that?”* – a sentiment that resonates deeply with the spirit of this project.

## Problem Statement

The project originated from a personal need: finding a suitable grow light for a grow tent. Traditional go-to solutions like metal halide (MH) and compact fluorescent lamps (CFL) are being phased out and replaced by LED alternatives. However, off-the-shelf LED grow light modules often come in standardized sizes that don't align well with all grow tent dimensions.

For instance, many commercial light fixtures are optimized for 1x1 meter tents, which leaves few viable options for other setups. In the case of a 90x60 cm tent, suitable high-quality lighting options are practically nonexistent.

## Project Goals

The primary objective of this project is to develop a modular lighting solution adaptable to various grow tent sizes, beginning with a system tailored for a 90x60 cm footprint. The technical aim is to design a lighting setup that not only fits this specific tent size but also surpasses the performance of a 300W CFL bulb in terms of light quality and efficiency.

To better understand the baseline, here is a comparison of common CFL grow lights:

| Wattage | Lumens | Lumens/W | Color Temp | Approx. PPF (µmol/s) | Notes |
|---------|--------|-----------|-------------|----------------------|-------|
| 125W    | 7,000  | 56        | 6400K       | ~100                 | Suitable for propagation and vegetative growth. [Source](https://www.hydrofarm.com/p/sunblaster-cfl-6400k-full-spectrum-lamp/sl0900163) |
| 150W    | 10,000 | 67        | 5000K       | ~120–130             | Daylight white, ideal for general plant growth. [Source](https://www.conservationmart.com/longstar-200w-120v-daylight-5u-mogul-base-cfl-fe-iiib-200w-50k-e39/) |
| 200W    | 12,000 | 60        | 6500K       | ~160                 | High output for larger grow areas. [Source](https://www.ledgrowlightshq.co.uk/cfl-grow-lights/) |
| 250W    | 16,000 | 64        | 2700K       | ~200                 | Warm white, promoting flowering stages. [Source](https://www.florastar-indoor.com/indoor-crop-lightning/cfl.html) |
| 300W    | 18,000 | 60        | 2700K       | ~240                 | Enhanced lumen output for extensive coverage. [Source](https://www.florastar-indoor.com/indoor-crop-lightning/cfl.html) |

*Note: PPF values are approximations, as CFLs typically have low photon efficiency (~0.8–1.0 µmol/J).*

While lumens measure perceived brightness for humans, PPF reflects the number of photons in the 400–700 nm range (photosynthetically active radiation, or PAR) that plants can actually use. Modern LED systems can often exceed **2.5 µmol/J**, more than double the photon efficiency of CFLs.

### Key Goals for the Lighting System

- **Higher Efficiency**: Targeting a PPF > 250 µmol/s for the same or lower power consumption than a 300W CFL.
- **Modularity**: Components can be rearranged to fit grow tents of varying sizes, not just 1x1 m setups.
- **Tunable Spectrum**: Improved spectrum control across growth stages, with options for deep red and blue enhancements.
- **Thermal and Mechanical Fit**: Designed specifically to avoid bulky cooling or wasted space in 90x60 cm tents.

This sets the foundation for a highly adaptable and efficient lighting system that can outperform traditional CFLs in both photosynthetic output and practical usability.