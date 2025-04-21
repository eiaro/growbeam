# Auto-detect container engine: prefer podman, fall back to docker
CONTAINER_ENGINE := $(shell command -v podman >/dev/null 2>&1 && echo podman || echo docker)

IMAGE := growbeam/kicad9-ci
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

# Clean generated output files
.PHONY: clean
clean:
	rm -f hardware/exports/erc.txt hardware/exports/drc.txt
