################################################################################
#
# go-bin
#
################################################################################

ifeq ($(HOSTARCH),aarch64)
GO_HOST_ARCH = arm64
else ifeq ($(HOSTARCH),x86_64)
GO_HOST_ARCH = amd64
else ifeq ($(HOSTARCH),x86)
GO_HOST_ARCH = 386
endif

GO_BIN_SITE = https://go.dev/dl
GO_BIN_SOURCE = go$(GO_VERSION).linux-$(GO_HOST_ARCH).tar.gz

GO_BIN_LICENSE = BSD-3-Clause
GO_BIN_LICENSE_FILES = LICENSE
GO_BIN_CPE_ID_VENDOR = golang

HOST_GO_BIN_PROVIDES = host-go
HOST_GO_BIN_DEPENDENCIES =

define HOST_GO_BIN_INSTALL_CMDS
	mkdir -p $(HOST_GO_ROOT)
	cd $(@D); cp -a * $(HOST_GO_ROOT)/

	$(GO_BINARIES_INSTALL_COMMON)
endef

$(eval $(host-generic-package))
