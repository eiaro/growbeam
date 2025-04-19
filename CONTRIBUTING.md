# Contributing to GrowBeam

Thank you for your interest in contributing!

We welcome improvements to hardware, documentation, automation, or anything that makes this project better.

---

## 🧰 How to Contribute

1. **Fork** the repo
2. **Create a branch**: `git checkout -b feature-xyz`
3. **Commit changes**: Describe your update clearly
4. **Push** to your fork
5. **Open a Pull Request`

---

## 📦 What You Can Contribute

- Improved schematics or layout
- Alternate LED configurations or drivers
- BOM optimization or cost reduction
- Documentation improvements
- Test results or case studies

---

## ⚙️ Local Testing (ERC/DRC)

You can use our `Makefile` to run checks and exports in a containerized environment  
(using `podman` or `docker`, whichever is available).

### 🔧 Build the container image:

```bash
make build-image
```

### 🧪 Run ERC and DRC:

```bash
make erc     # Check electrical rules (schematic)
make drc     # Check design rules (PCB)
```

Violations will be written to:

- `hardware/exports/erc.txt`
- `hardware/exports/drc.txt`

### 🧹 Clean up:

```bash
make clean
```

---

## ✅ Pull Request Checklist

Before submitting a pull request:

- [ ] Run `make erc` and `make drc` and ensure they pass
- [ ] Do not manually edit `hardware/bom.csv` or files in `exports/` — they are generated automatically
- [ ] Keep commits focused and relevant
- [ ] Follow formatting and naming conventions

---

## 💬 Questions?

Open an issue or start a discussion in the GitHub repo. We're happy to collaborate!
