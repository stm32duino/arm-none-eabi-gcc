SHELL = /bin/sh

.SUFFIXES: .tar.bz2

ROOT_PATH := .
DOWNLOAD_PATH := download

OS ?=$(shell uname -s)

# -----------------------------------------------------------------------------
ifeq (postpackaging_arm-gcc,$(findstring $(MAKECMDGOALS),postpackaging_arm-gcc))
  PACKAGE_WIN_FILENAME=$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-windows.tar.bz2
  PACKAGE_LINUX32_FILENAME=$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-linux32.tar.bz2
  PACKAGE_LINUX64_FILENAME=$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-linux64.tar.bz2
  PACKAGE_MAC_FILENAME=$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-mac.tar.bz2

  PACKAGE_WIN_CHKSUM := $(firstword $(shell shasum -a 256 "$(DOWNLOAD_PATH)/$(PACKAGE_WIN_FILENAME)"))
  PACKAGE_LINUX32_CHKSUM := $(firstword $(shell shasum -a 256 "$(DOWNLOAD_PATH)/$(PACKAGE_LINUX32_FILENAME)"))
  PACKAGE_LINUX64_CHKSUM := $(firstword $(shell shasum -a 256 "$(DOWNLOAD_PATH)/$(PACKAGE_LINUX64_FILENAME)"))
  PACKAGE_MAC_CHKSUM := $(firstword $(shell shasum -a 256 "$(DOWNLOAD_PATH)/$(PACKAGE_MAC_FILENAME)"))

  PACKAGE_WIN_SIZE := $(firstword $(shell wc -c "$(DOWNLOAD_PATH)/$(PACKAGE_WIN_FILENAME)"))
  PACKAGE_LINUX32_SIZE := $(firstword $(shell wc -c "$(DOWNLOAD_PATH)/$(PACKAGE_LINUX32_FILENAME)"))
  PACKAGE_LINUX64_SIZE := $(firstword $(shell wc -c "$(DOWNLOAD_PATH)/$(PACKAGE_LINUX64_FILENAME)"))
  PACKAGE_MAC_SIZE := $(firstword $(shell wc -c "$(DOWNLOAD_PATH)/$(PACKAGE_MAC_FILENAME)"))
endif

# -----------------------------------------------------------------------------

.PHONY: all clean tools print_info postpackaging

all: arm-gcc

arm-gcc: PACKAGE_NAME := arm-none-eabi-gcc
arm-gcc: PACKAGE_FOLDER := $(DOWNLOAD_PATH)
arm-gcc: PACKAGE_FILENAME := gcc-arm-none-eabi
arm-gcc: PACKAGE_VERSION := $(shell ./github_cli.sh)
arm-gcc: clean print_info
	@echo ----------------------------------------------------------
	@echo "Packaging $@..."
	@[ -d $(DOWNLOAD_PATH) ] || mkdir $(DOWNLOAD_PATH)
	@cd $(DOWNLOAD_PATH); wget https://github.com/stm32duino/$(PACKAGE_NAME)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-linux32.tar.bz2
	@cd $(DOWNLOAD_PATH); wget https://github.com/stm32duino/$(PACKAGE_NAME)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-linux64.tar.bz2
	@cd $(DOWNLOAD_PATH); wget https://github.com/stm32duino/$(PACKAGE_NAME)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-mac.tar.bz2
	@cd $(DOWNLOAD_PATH); wget https://github.com/stm32duino/$(PACKAGE_NAME)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_FILENAME)-$(PACKAGE_VERSION)-windows.tar.bz2
	$(MAKE) PACKAGE_NAME=$(PACKAGE_NAME) PACKAGE_VERSION=$(PACKAGE_VERSION) PACKAGE_FILENAME=$(PACKAGE_FILENAME) --no-builtin-rules postpackaging_arm-gcc -C .
	@echo ----------------------------------------------------------

clean:
	@echo ----------------------------------------------------------
	@echo  Cleanup
	-$(RM) *.tar.bz2 package_*.json
	-$(RM) -r $(DOWNLOAD_PATH)
	@echo ----------------------------------------------------------

print_info:
	@echo ----------------------------------------------------------
	@echo Building $(PACKAGE_NAME) using
	@echo "CURDIR              = $(CURDIR)"
	@echo "OS                  = $(OS)"
	@echo "SHELL               = $(SHELL)"
	@echo "PACKAGE_NAME        = $(PACKAGE_NAME)"
	@echo "PACKAGE_FOLDER      = $(PACKAGE_FOLDER)"
	@echo "PACKAGE_VERSION     = $(PACKAGE_VERSION)"


postpackaging_arm-gcc:
	@echo "PACKAGE_WIN_FILENAME    = $(PACKAGE_WIN_FILENAME)"
	@echo "PACKAGE_WIN_SIZE        = $(PACKAGE_WIN_SIZE)"
	@echo "PACKAGE_WIN_CHKSUM      = $(PACKAGE_WIN_CHKSUM)"
	@echo "PACKAGE_LINUX32_FILENAME  = $(PACKAGE_LINUX32_FILENAME)"
	@echo "PACKAGE_LINUX32_SIZE      = $(PACKAGE_LINUX32_SIZE)"
	@echo "PACKAGE_LINUX32_CHKSUM    = $(PACKAGE_LINUX32_CHKSUM)"
	@echo "PACKAGE_LINUX64_FILENAME  = $(PACKAGE_LINUX64_FILENAME)"
	@echo "PACKAGE_LINUX64_SIZE      = $(PACKAGE_LINUX64_SIZE)"
	@echo "PACKAGE_LINUX64_CHKSUM    = $(PACKAGE_LINUX64_CHKSUM)"
	@echo "PACKAGE_MAC_FILENAME    = $(PACKAGE_MAC_FILENAME)"
	@echo "PACKAGE_MAC_SIZE        = $(PACKAGE_MAC_SIZE)"
	@echo "PACKAGE_MAC_CHKSUM      = $(PACKAGE_MAC_CHKSUM)"
	@cat templates/package_arm_index.json | sed s/%%PACKAGENAME%%/$(PACKAGE_NAME)/ | sed s/%%VERSION%%/$(PACKAGE_VERSION)/ | sed s/%%FILENAMEWIN%%/$(PACKAGE_WIN_FILENAME)/ | sed s/%%CHECKSUMWIN%%/$(PACKAGE_WIN_CHKSUM)/ | sed s/%%SIZEWIN%%/$(PACKAGE_WIN_SIZE)/ | sed s/%%FILENAMEMAC%%/$(PACKAGE_MAC_FILENAME)/ | sed s/%%CHECKSUMMAC%%/$(PACKAGE_MAC_CHKSUM)/ | sed s/%%SIZEMAC%%/$(PACKAGE_MAC_SIZE)/ | sed s/%%FILENAMELINUX64%%/$(PACKAGE_LINUX64_FILENAME)/ | sed s/%%CHECKSUMLINUX64%%/$(PACKAGE_LINUX64_CHKSUM)/ | sed s/%%SIZELINUX64%%/$(PACKAGE_LINUX64_SIZE)/ | sed s/%%FILENAMELINUX32%%/$(PACKAGE_LINUX32_FILENAME)/ | sed s/%%CHECKSUMLINUX32%%/$(PACKAGE_LINUX32_CHKSUM)/ | sed s/%%SIZELINUX32%%/$(PACKAGE_LINUX32_SIZE)/ > package_$(PACKAGE_NAME)_$(PACKAGE_VERSION)_index.json
	@echo "package_$(PACKAGE_NAME)_$(PACKAGE_VERSION)_index.json created"
