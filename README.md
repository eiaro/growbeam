# GrowBeam

> A high-efficiency, open-source grow light module for indoor gardeners and hardware hackers.

![License: CERN-OHL-S](https://img.shields.io/badge/license-CERN--OHL--S-blue)
![Status: Active](https://img.shields.io/badge/status-active-brightgreen)
[![ERC and DRC](https://github.com/eiaro/growbeam/actions/workflows/erc_and_drc.yml/badge.svg)](https://github.com/eiaro/growbeam/actions/workflows/erc_and_drc.yml)
![Last Commit](https://img.shields.io/github/last-commit/eiaro/growbeam)
![Issues](https://img.shields.io/github/issues/eiaro/growbeam)
[![Code of Conduct](https://img.shields.io/badge/Conduct-active-brightgreen)](CODE_OF_CONDUCT.md)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Feiaro.github.io%2Fgrowbeam)](https://eiaro.github.io/growbeam/)


**GrowBeam** is a modular open-source grow light system designed for indoor gardens, hydroponic setups, and controlled environment agriculture. Each module combines high-efficiency white and deep red LEDs to provide a balanced light spectrum optimized for plant growth.

**NOTE** A test batch is currently ordered. Details to follow soon(tm).

---

## 🌱 Features

- Modular and scalable design
- Uses Samsung LM301H (white) and LUXEON SunPlus 2835 (660 nm red) LEDs
- Designed for 42 V DC input (constant current)
- Simple current-limiting resistor configuration
- Passive cooling (no fans required)
- Easy to manufacture and assemble

## 💡 Light Output & Efficiency

GrowBeam is designed to deliver high photosynthetically active radiation (PAR) while consuming minimal power. Below is a breakdown of light performance based on actual component data:

These values are based on typical LED performance from manufacturer datasheets under standard current levels.

### 🔢 Estimated Output (Per Module)

| Component                   | Qty | PPF per LED (μmol/s) | Total PPF (μmol/s) |
|----------------------------|-----|-----------------------|---------------------|
| Samsung LM301H (white)     | 60  | ~0.56                 | ~33.5               |
| LUXEON 2835 Deep Red (660 nm) | 15  | ~0.60                 | ~9                |
| **Total**                  | –   | –                     | **~42.5 μmol/s**    |

- **Power consumption:** ~16.4 W  
- **Photosynthetic Photon Efficacy (PPE):** ~2.60 μmol/J

---

### 🔁 Comparison with Other Light Sources

| Light Source               | Power | PPF (μmol/s) | PPE (μmol/J) | Notes                           |
|---------------------------|--------|--------------|--------------|----------------------------------|
| **GrowBeam**              | ~16 W | ~42        | ~2.6        | High-efficiency DIY module ✅     |
| HPS 400W                  | 400 W  | ~550         | ~1.4         | High heat, low efficiency ❌      |
| Generic LED Panel (20W)   | 20 W   | ~15–20       | ~0.75–1.0    | Often misleading specs ❌        |
| T5 Fluorescent Tube (24W) | 24 W   | ~28          | ~1.2         | Narrow spectrum, low efficacy ❌ |
| Commercial Grow LED (LM301H) | 100 W | ~270         | ~2.7         | Comparable to GrowBeam ✅        |

---

GrowBeam matches the efficiency of premium grow lights using open hardware and off-the-shelf components — making it a great choice for small to medium-scale indoor growers.

---

## 🛠️ Hardware Overview

Each GrowBeam module contains:
- 5 LED strings with 12 × Samsung LM301H (white)
- 1 LED string with 15 × LUXEON SunPlus 2835 Deep Red

All strings are powered by a shared 42 V DC constant current source and operate at approx. 65 mA per string.

## 📋 Bill of Materials (BoM)

You’ll find a complete part list in `hardware/bom.csv`.  
Key components include:

- 60 × Samsung LM301H white LEDs
- 15 × LUXEON SunPlus 2835 Deep Red LEDs
- Al MCPCB (196 × 35 mm, aluminum-backed recommended)

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
