# 💡 Electrical Design

## Power Supply

- **Driver:** Meanwell ELG-240-42AB-3Y  
- **Mode:** Constant current  
- **Nominal Output:** 240W @ 42VDC  
- **Set Output Current:** 4.55 A  
- **Configured for 10 modules (5 + 5)**

## LED Configuration

Each module contains:
- 6 strings × 12 white LEDs (SPMWHD32AMH0XAMAPL)
- 1 string × 15 deep red LEDs (L1SP-DRD0002800000)
- Total: 7 LED strings per module, all driven in parallel

Current per module:
- 4.55 A / 10 modules = 455 mA per module
- 455 mA / 7 strings ≈ **65 mA per string**

## Forward Voltage (per string)

| Type       | LEDs in series | Est. Vf @ 65 mA | Voltage |
|------------|----------------|------------------|---------|
| White      | 12             | ~3.2 V           | ~38.4 V |
| Deep Red   | 15             | ~2.3 V           | ~34.5 V |

All well within the driver's 42 V output limit ✅

## Power and Light Output Per Module

| Type       | Count | Current | Power  | Output             |
|------------|-------|---------|--------|--------------------|
| White LEDs | 72    | 6×65 mA | ~9.9 W | ~1870 lumens       |
| Red LEDs   | 15    | 1×65 mA | ~2.3 W | ~1.5 W radiant (660 nm) |
| **Total**  | –     | 455 mA  | ~12.2 W| ~1870 lm + 1.5 W red |

## System Totals (10 Modules)

- **Total Current:** 4.55 A
- **Total Power:** ~122 W
- **Luminous Output:** ~18,700 lumens
- **660 nm Radiant Power:** ~15 W

## PPF (Photosynthetic Photon Flux)

- White: 1870 lm / 70 ≈ **26.7 μmol/s**
- Red: 1.5 W × 4.58 μmol/s/W ≈ **6.87 μmol/s**
- **PPF per module:** ~33.6 μmol/s
- **Total PPF (10 modules):** **~336 μmol/s**

## PPFD in 90×60 cm Grow Tent

Tent area: 0.9 m × 0.6 m = **0.54 m²**

\[
\text{PPFD} = \frac{336\,μmol/s}{0.54\,m²} ≈ 	extbf{622 μmol/m²/s}
\]

### Summary

| Application           | Recommended PPFD | Your PPFD | Outcome                      |
|-----------------------|------------------|-----------|------------------------------|
| Microgreens / Lettuce | 100–400          | ✅ 622    | Excellent growth             |
| Tomatoes / Peppers    | 600–900          | ✅ 622    | Very good / near optimal     |
| Cannabis Flowering    | 800–1000         | ⚠️ 622    | Slightly low, still usable   |

This system provides powerful and efficient lighting for high-performance plant growth in a compact 90×60 cm grow space.
