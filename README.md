# GrowBeam

**GrowBeam** is a modular open-source grow light system designed for indoor gardens, hydroponic setups, and controlled environment agriculture. Each module combines high-efficiency white and deep red LEDs to provide a balanced light spectrum optimized for plant growth.

---

## 🌱 Features

- Modular and scalable design
- Uses Samsung LM301H (white) and LUXEON SunPlus 2835 (660 nm red) LEDs
- Designed for 24 V DC input
- Simple current-limiting resistor configuration
- Passive cooling (no fans required)
- Easy to manufacture and assemble

---

## 🛠️ Hardware Overview

Each GrowBeam module contains:
- 3 LED strings with 7 × Samsung LM301H (white)
- 1 LED string with 9 × LUXEON SunPlus 2835 Deep Red
- Current-limiting resistors:
  - 75 Ω for white LEDs
  - 51 Ω for red LEDs

All strings are powered by a shared 24 V DC source and operate at approx. 60–100 mA per string.

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
2. Open schematics in KiCad from `hardware/schematics/`
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

