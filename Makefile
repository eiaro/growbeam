# Auto-detect container engine: prefer podman, fall back to docker
CONTAINER_ENGINE := $(shell command -v podman >/dev/null 2>&1 && echo podman || echo docker)

IMAGE := ghcr.io/eiaro/kicad9-ci:latest
WORKDIR := /workspace

# Paths
SCHEMATIC := hardware/kicad_project/growbeam.kicad_sch
PCB := hardware/kicad_project/growbeam.kicad_pcb
EXPORT_DIR := hardware/exports
ASSETS_DIR := docs/assets

# ====== Build everything ======
.PHONY: all
all: erc drc export docs-assets doc-build ## Run full export and build process

# ====== Docker image ======
.PHONY: build-image
build-image: ## Build container image for CLI use
	$(CONTAINER_ENGINE) build -t $(IMAGE) -f docker/Dockerfile .

# ====== KiCad validation ======
.PHONY: erc
erc: ## Run schematic ERC check
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli sch erc --severity-error $(SCHEMATIC) -o $(EXPORT_DIR)/erc.txt

.PHONY: drc
drc: ## Run PCB DRC check
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli pcb drc --severity-error $(PCB) -o $(EXPORT_DIR)/drc.txt

# ====== Export rules ======
.PHONY: export export-bom export-schematic export-step export-vrml export-gerbers

export: export-bom export-schematic export-step export-vrml export-gerbers ## Run all export targets

export-bom: ## Export BOM as CSV from schematic using preset
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	bash -c "mkdir -p $(EXPORT_DIR) && \
	kicad-cli sch export bom \
	--preset \"growbeam-bom\" \
	-o $(EXPORT_DIR)/bom.csv \
	$(SCHEMATIC)"

export-schematic: ## Export schematic as PDF
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli sch export pdf $(SCHEMATIC) -o $(EXPORT_DIR)/schematic.pdf

export-step: ## Export STEP model
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli pcb export step $(PCB) -o $(EXPORT_DIR)/growbeam.step

export-vrml: ## Export VRML model and render in Blender
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	bash -c "kicad-cli pcb export vrml $(PCB) -o $(EXPORT_DIR)/growbeam.wrl && \
	blender -b --python tools/blender_render.py"

export-gerbers: ## Export Gerber files
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli pcb export gerbers $(PCB) -o $(EXPORT_DIR)/gerbers

# ====== MkDocs / Documentation ======
.PHONY: docs-assets bom-md schematic doc-build serve clean-docs

docs-assets: bom-md schematic ## Generate BOM + schematic for documentation

bom-md: export-bom ## Convert BOM CSV to Markdown
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	python3 tools/generate_bom_md.py $(EXPORT_DIR)/bom.csv docs/_includes/bom.md

schematic: ## Export and optimize SVG schematic
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) bash -c "\
		rm -rf $(EXPORT_DIR)/schematic_raw && \
		kicad-cli sch export svg -n -e $(SCHEMATIC) -o $(EXPORT_DIR)/schematic_raw && \
		python3 tools/optimize_svgs.py $(EXPORT_DIR)/schematic_raw/growbeam.svg $(ASSETS_DIR)/schematic.svg && \
		rm -rf $(EXPORT_DIR)/schematic_raw"

doc-build: docs-assets ## Build MkDocs site
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	mkdocs build

serve: docs-assets ## Serve documentation locally
	$(CONTAINER_ENGINE) run --rm -p 8000:8000 -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	mkdocs serve -a 0.0.0.0:8000

clean-docs: ## Clean MkDocs site output
	rm -rf site

# ====== Cleanup ======
.PHONY: clean
clean: ## Remove ERC/DRC check files
	rm -f $(EXPORT_DIR)/erc.txt $(EXPORT_DIR)/drc.txt

# ====== Help ======
.PHONY: help
help: ## Show available make targets
	@echo "Available make targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'
