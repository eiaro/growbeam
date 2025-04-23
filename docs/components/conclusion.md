## 📏 Mechanical Layout Summary

- **Module dimensions:** Each LED module measures **150 mm × 20 mm**
- **Backing material:** Mounted on standard **aluminium U-channel** for both structural and thermal purposes
- **System layout:** 
  - **5 rails**
  - **4 modules per rail**
  - Total of **20 modules**

---

## 💡 LED Configuration per Module

Each module includes:

- **21× white LEDs** (Samsung LM301H)
- **9× deep red LEDs** (LUXEON SunPlus 2835)

This configuration provides a balanced spectrum suitable for both vegetative and flowering phases, and ensures uniform light distribution across the grow area.


## 🌡️ Thermal Estimation (Ballpark)

This section provides a rough estimate of thermal performance for the GrowBeam LED modules, based on typical power dissipation and passive cooling assumptions.

---

### 🔢 Assumptions

- **Number of modules:** 20
- **Power per module:** ~6 W (includes both LED and resistor heat)
- **Total system power:**

$$
20 \times 6\,\text{W} = 120\,\text{W}
$$

- **LED efficiency:** ~45–50%  
  → Approx. 50–55% of power becomes heat

- **Heat per module:**

$$
6\,\text{W} \times 0.5 = 3\,\text{W}
$$

- **Cooling method:** Passive convection via aluminum U-channel
- **Estimated thermal resistance (rule of thumb):**  
  ~10 °C/W per module (small surface, no forced airflow)

---

### 📈 Temperature Rise Estimate

$$
\Delta T = 3\,\text{W} \times 10\,^\circ\text{C/W} = 30\,^\circ\text{C}
$$

---

### 🧠 Conclusion

- **Ambient temperature:** ~25 °C
- **Estimated module temperature:**

$$
25\,^\circ\text{C} + 30\,^\circ\text{C} = 55\,^\circ\text{C}
$$

This is within safe range for both LED junction temperatures and resistor ratings, assuming good thermal contact and open airflow.

> ⚠️ This is a rough estimate. Measurements should be taken to validate in real conditions.
