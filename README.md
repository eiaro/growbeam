# GrowBeam

> A high-efficiency, open-source grow light module for indoor gardeners and hardware hackers.

![License: CERN-OHL-S](https://img.shields.io/badge/license-CERN--OHL--S-blue)
![Status: Active](https://img.shields.io/badge/status-active-brightgreen)
![CI](https://github.com/eiaro/growbeam/actions/workflows/export.yml/badge.svg)
![Last Commit](https://img.shields.io/github/last-commit/eiaro/growbeam)
![Issues](https://img.shields.io/github/issues/eiaro/growbeam)
[![Code of Conduct](https://img.shields.io/badge/Conduct-active-brightgreen)](CODE_OF_CONDUCT.md)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Feiaro.github.io%2Fgrowbeam)](https://eiaro.github.io/growbeam/)


**GrowBeam** is a modular open-source grow light system designed for indoor gardens, hydroponic setups, and controlled environment agriculture. Each module combines high-efficiency white and deep red LEDs to provide a balanced light spectrum optimized for plant growth.

Each GrowBeam module measures 150 × 20 mm and can be combined to create 600 mm light bars — a perfect fit for standard grow tents. For example, using 5 bars in a 90 × 60 cm tent means 20 modules — delivering ~130 W of pure, growth-optimized light.

---

## 🌱 Features

- Modular and scalable design
- Uses Samsung LM301H (white) and LUXEON SunPlus 2835 (660 nm red) LEDs
- Designed for 24 V DC input
- Simple current-limiting resistor configuration
- Passive cooling (no fans required)
- Easy to manufacture and assemble

## 💡 Light Output & Efficiency

GrowBeam is designed to deliver high photosynthetically active radiation (PAR) while consuming minimal power. Below is a breakdown of light performance based on actual component data:

These values are based on typical LED performance from manufacturer datasheets under standard current levels.

### 🔢 Estimated Output (Per Module)

| Component                   | Qty | PPF per LED (μmol/s) | Total PPF (μmol/s) |
|----------------------------|-----|-----------------------|---------------------|
| Samsung LM301H (white)     | 21  | ~0.56                 | ~11.8               |
| LUXEON 2835 Deep Red (660 nm) | 9   | ~0.60                 | ~5.4                |
| **Total**                  | –   | –                     | **~17.2 μmol/s**    |

- **Power consumption:** ~6.5 W  
- **Photosynthetic Photon Efficacy (PPE):** ~2.65 μmol/J

---

### 🔁 Comparison with Other Light Sources

| Light Source               | Power | PPF (μmol/s) | PPE (μmol/J) | Notes                           |
|---------------------------|--------|--------------|--------------|----------------------------------|
| **GrowBeam**              | ~6.5 W | ~17.2        | ~2.65        | High-efficiency DIY module ✅     |
| HPS 400W                  | 400 W  | ~550         | ~1.4         | High heat, low efficiency ❌      |
| Generic LED Panel (20W)   | 20 W   | ~15–20       | ~0.75–1.0    | Often misleading specs ❌        |
| T5 Fluorescent Tube (24W) | 24 W   | ~28          | ~1.2         | Narrow spectrum, low efficacy ❌ |
| Commercial Grow LED (LM301H) | 100 W | ~270         | ~2.7         | Comparable to GrowBeam ✅        |

---

GrowBeam matches the efficiency of premium grow lights using open hardware and off-the-shelf components — making it a great choice for small to medium-scale indoor growers.

---

## 🛠️ Hardware Overview

Each GrowBeam module contains:
- 3 LED strings with 7 × Samsung LM301H (white)
- 1 LED string with 9 × LUXEON SunPlus 2835 Deep Red
- Current-limiting resistors:
  - 75 Ω for white LEDs
  - 51 Ω for red LEDs

All strings are powered by a shared 24 V DC source and operate at approx. 60–100 mA per string.

## 📋 Bill of Materials (BoM)

You’ll find a complete part list in `hardware/bom.csv`.  
Key components include:

- 21 × Samsung LM301H white LEDs
- 9 × LUXEON SunPlus 2835 Deep Red LEDs
- 3 × 75 Ω resistors (0.5 W, 1206)
- 1 × 51 Ω resistor (0.5 W, 1206)
- FR4 PCB (150 × 20 mm, aluminum-backed recommended)

---

## 📂 Repository Structure
```
growbeam/
├── hardware/
│   ├── kicad_project/           # Contains .kicad_pro, .kicad_sch, .kicad_pcb files, etc.
│   ├── exports/                 # Gerber files, BOM, pick & place, and fabrication outputs
│   └── bom.csv                  # Human-readable bill of materials (optional auto-generated)
├── docs/                        # Additional documentation, test results, diagrams
├── images/                      # Renders, module photos, screenshots
├── LICENSE                      # CERN-OHL v2-S license file
├── README.md                    # Project description and usage guide
├── .gitignore                   # Ignore KiCad backups and build artifacts
└── CONTRIBUTING.md              # (Optional) Contribution guidelines
```

---

## 🧪 Getting Started

1. Clone the repository:  
   `git clone https://github.com/eiaro/growbeam.git`
2. Open the KiCad project in `hardware/kicad_project/`
3. Order parts using the BOM (`hardware/bom.csv`)
4. Assemble and test each module with a 24 V power supply

---

## 📸 Gallery

*(Add photos or renders here)*  
![Module example](images/growbeam-example.jpg)

---

## 📄 License

This project is licensed under the **CERN Open Hardware License v2-S (Strongly Reciprocal)**.  
See the [LICENSE](./LICENSE) file for full terms.

You are free to use, modify, manufacture, and distribute this project, provided that all modifications remain open under the same license.

---

## 🤝 Contributing

Contributions, improvements, and bug reports are welcome!  
If you build your own GrowBeam modules, feel free to share them via issues or pull requests.

## 🙏 Acknowledgements

- Samsung and Lumileds for their detailed datasheets and high-quality horticulture LEDs.
- Open Source Hardware community for inspiration and resources.

## 🌐 Community & Contact

Questions, ideas, or want to showcase your build?  
Open an [issue](https://github.com/eiaro/growbeam/issues) or reach out via [@eiaro](https://github.com/eiaro).
