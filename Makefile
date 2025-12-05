# Makefile for firearm mortality and law data processing
#
# Usage:
#	make all:			- Run complete pipeline
#	make fetch			- Run fetch script only
#	make clean			- Run clean/merge script only
#
# You can also run specific parts by calling the target name

.PHONY: all fetch clean process help

# Default target: run pipeline
all: fetch clean

# fetch target
fetch:
		Rscript scripts/R/00_fetch.R \
		--mortality "data-table.csv" \
		--laws "TL-A243-2-v3 State Firearm Law Database 5.0.xlsx"

# clean/merge target
clean process:
		Rscript scripts/R/01_clean_merge.R

# Help target to show available commands
help:
	@echo "Available Targets:"
	@echo "  make all           - Run complete R pipeline (fetch + clean)"
	@echo "  make fetch         - Run R fetch script only"
	@echo "  make clean         - Run R clean/merge script only"
	@echo ""
	@echo "Example:"
	@echo "  make fetch         - Only fetch data"
	@echo "  make all           - Run full pipeline"
