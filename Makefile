# Makefile

# Define default Go build flags
LDFLAGS = -s -w

# Set GoOS and GoARCH (can override in command line)
GOOS ?= linux
GOARCH ?= amd64

# The binary name and output location
BINARY_NAME = parm-e2e
OUTPUT_DIR = ./bin

# Make sure the output directory exists
$(shell mkdir -p $(OUTPUT_DIR))

# Default target (build all platforms and create tarballs/zips)
all: build-linux build-darwin build-windows

# Build and create tarball for Linux
build-linux:
	@echo "Building for Linux..."
	GOOS=linux GOARCH=amd64 go build -ldflags="$(LDFLAGS)" -o $(OUTPUT_DIR)/$(BINARY_NAME)
	@echo "Creating tarball for Linux..."
	tar -czvf $(OUTPUT_DIR)/$(BINARY_NAME)-linux-amd64.tar.gz -C $(OUTPUT_DIR) $(BINARY_NAME)
	@echo "Deleting binary for Linux..."
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)

# Build and create tarball for macOS (Darwin)
build-darwin:
	@echo "Building for macOS..."
	GOOS=darwin GOARCH=amd64 go build -ldflags="$(LDFLAGS)" -o $(OUTPUT_DIR)/$(BINARY_NAME)
	@echo "Creating tarball for macOS..."
	tar -czvf $(OUTPUT_DIR)/$(BINARY_NAME)-darwin-amd64.tar.gz -C $(OUTPUT_DIR) $(BINARY_NAME)
	@echo "Deleting binary for macOS..."
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)

# Build and create zip file for Windows
build-windows:
	@echo "Building for Windows..."
	GOOS=windows GOARCH=amd64 go build -ldflags="$(LDFLAGS)" -o $(OUTPUT_DIR)/$(BINARY_NAME).exe
	@echo "Creating zip file for Windows..."
	zip -r $(OUTPUT_DIR)/$(BINARY_NAME)-windows-amd64.zip $(OUTPUT_DIR)/$(BINARY_NAME).exe
	@echo "Deleting binary for Windows..."
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME).exe

# Clean up build artifacts
clean:
	rm -rf $(OUTPUT_DIR)
