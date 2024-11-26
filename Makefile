.PHONY: build help install run

NAME=com.github.tmedwards.tweego
MANIFEST=$(NAME).yml
BUILD_DIR=build-dir
PWD=$(shell pwd)

default: help

build:
	flatpak-builder --force-clean $(BUILD_DIR) $(MANIFEST)

help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "build   – Build tweego"
	@echo "install – Install tweego"
	@echo "run     – Run tweego with story.twee"

install:
	flatpak-builder --user --install --force-clean $(BUILD_DIR) $(MANIFEST)

public:
	mkdir -p public

run: story.twee public
	flatpak run --filesystem=$(PWD)/story.twee:ro \
		--filesystem=$(PWD)/public:rw $(NAME) \
		-o public/index.html $<
