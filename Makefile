SHELL = /bin/bash

BUILD_DIR := ./build
DIST_DIR  := ./dist
SRC_DIR   := ./src
BIN_NAME := tsm
BIN_DIR := $(DIST_DIR)/bin
FUNCTIONS_DIR := $(DIST_DIR)/functions

FILES := shebang logo setup $(addsuffix /*,core utils helpers commands) main tsm
SRC_FILES := $(addsuffix .zsh,$(addprefix $(SRC_DIR)/,$(FILES)))
COMPLETION_FILE := ./share/zsh/_tsm
VERSION_FILE := VERSION.txt

all: build

.PHONY: release
release: build
	@mkdir -p -m 700 $(BIN_DIR) $(FUNCTIONS_DIR)
	@cp -f $(BUILD_DIR)/$(BIN_NAME) $(BIN_DIR)/$(BIN_NAME)
	@cp -f $(COMPLETION_FILE) $(FUNCTIONS_DIR)/
	@$(BIN_DIR)/$(BIN_NAME) version > $(VERSION_FILE)

.PHONY: build
build: $(SRC_FILES)
	@mkdir -p -m 700 $(BUILD_DIR)
	@awk 'FNR==1 && NR > 1 {print ""}{print}' $(SRC_FILES) > $(BUILD_DIR)/$(BIN_NAME)
	@chmod a+x $(BUILD_DIR)/$(BIN_NAME)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
