# Auto-detect container engine: prefer podman, fall back to docker
CONTAINER_ENGINE := $(shell command -v podman >/dev/null 2>&1 && echo podman || echo docker)

IMAGE := ghcr.io/eiaro/kicad9-ci:latest
WORKDIR := /workspace

# Build the Docker/Podman image for KiCad 9 CLI
.PHONY: build-image
build-image:
	$(CONTAINER_ENGINE) build -t $(IMAGE) -f docker/Dockerfile .

# Run ERC check
.PHONY: erc
erc:
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli sch erc --severity-error hardware/kicad_project/growbeam.kicad_sch -o hardware/exports/erc.txt

# Run DRC check
.PHONY: drc
drc:
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) \
	kicad-cli pcb drc --severity-error hardware/kicad_project/growbeam.kicad_pcb -o hardware/exports/drc.txt

.PHONY: export
export:
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) bash -c "\
		mkdir -p $(WORKDIR)/hardware/exports && \
		kicad-cli sch export bom $(WORKDIR)/hardware/kicad_project/*.kicad_sch -o $(WORKDIR)/hardware/bom.csv && \
		kicad-cli sch export pdf $(WORKDIR)/hardware/kicad_project/*.kicad_sch -o $(WORKDIR)/hardware/exports/schematic.pdf && \
		kicad-cli pcb export gerbers $(WORKDIR)/hardware/kicad_project/*.kicad_pcb -o $(WORKDIR)/hardware/exports/gerbers && \
		kicad-cli pcb export step $(WORKDIR)/hardware/kicad_project/*.kicad_pcb -o $(WORKDIR)/hardware/exports/growbeam.step && \
		kicad-cli pcb export vrml $(WORKDIR)/hardware/kicad_project/*.kicad_pcb -o $(WORKDIR)/hardware/exports/growbeam.wrl && \
		blender -b --python render/blender_render.py"

.PHONY: schematic
schematic:
	$(CONTAINER_ENGINE) run --rm -v "$(PWD):$(WORKDIR)" -w $(WORKDIR) $(IMAGE) bash -c "\
		rm -rf hardware/exports/schematic_raw && \
		kicad-cli sch export svg -n -e hardware/kicad_project/*.kicad_sch -o hardware/exports/schematic_raw && \
		python3 tools/optimize_svgs.py hardware/exports/schematic_raw/growbeam.svg docs/assets/schematic.svg && \
		rm -rf hardware/exports/schematic_raw"

# Clean generated output files
.PHONY: clean
clean:
	rm -f hardware/exports/erc.txt hardware/exports/drc.txt

# Optimize SVG files in exports
.PHONY: optimize
optimize:
	@echo "🔧 Optimizing SVGs in docs/assets/exports..."
	python3 tools/optimize_svgs.py

# Serve MkDocs locally with optimization
.PHONY: serve
serve: optimize
	mkdocs serve

# Build static site with optimization
.PHONY: doc-build
doc-build: optimize
	mkdocs build

# Clean docs output and optimized assets
.PHONY: clean-docs
clean-docs:
	rm -rf site
	