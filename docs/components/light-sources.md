---
title: "Chapter 4 - Design and Decisions"
weight: 50
---

## LED Selection and Count

The primary performance goal is to exceed a 400W CFL, which corresponds to a Photosynthetic Photon Flux (PPF) of around **240 µmol/s**.

By distributing this across **20 modules**, each module must contribute at least **12 µmol/s**. Based on LED datasheets and real-world test reports, this output can be achieved with:

- **21 × Samsung LM301H** (white)
- **9 × LUXEON SunPlus 2835** (660 nm red)

These LEDs were selected for their:

- High photon efficacy (over 2.9 µmol/J for LM301H)
- Proven horticultural performance
- Readily available small-quantity distribution (e.g., via DigiKey, Mouser)

> Availability is an often-overlooked design constraint. While reels of 4000 LEDs may be cost-effective per unit, they lock out hobbyists and prototypes. Choosing widely stocked horticulture-grade LEDs ensures GrowBeam can be built by individuals without industry-scale procurement.