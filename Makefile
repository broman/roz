SCHEME=roz
CONFIG=Release
TARGET=roz
ENTITLEMENTS=roz.entitlements

DERIVED_DATA=build
BUILD_PATH=$(DERIVED_DATA)/Build/Products/$(CONFIG)
APP_BINARY=$(BUILD_PATH)/$(TARGET)
SIGNED_BINARY=release/$(TARGET)

PKGROOT=pkgroot
PKGINSTALLPATH=/usr/local/bin
PKGID=gov.ca.calstrs.roz
PKGNAME=roz.pkg

all: clean build sign

clean:
	rm -rf $(DERIVED_DATA) release $(PKGROOT) $(PKGNAME)
	mkdir -p release

build:
	xcodebuild \
		-scheme $(SCHEME) \
		-configuration $(CONFIG) \
		-derivedDataPath $(DERIVED_DATA) \
		CODE_SIGN_ENTITLEMENTS="$(ENTITLEMENTS)" \
		CODE_SIGN_IDENTITY="-" \
		ENABLE_HARDENED_RUNTIME=YES \
		OTHER_CODE_SIGN_FLAGS="--timestamp"

sign:
	codesign --force --options runtime \
		--entitlements $(ENTITLEMENTS) \
		--sign - \
		-o runtime \
		$(APP_BINARY)
	cp $(APP_BINARY) $(SIGNED_BINARY)
	@echo "Signed and copied to $(SIGNED_BINARY)"

pkg: all
	mkdir -p $(PKGROOT)$(PKGINSTALLPATH)
	cp $(SIGNED_BINARY) $(PKGROOT)$(PKGINSTALLPATH)/$(TARGET)
	chmod +x $(PKGROOT)$(PKGINSTALLPATH)/$(TARGET)
	pkgbuild \
		--root $(PKGROOT) \
		--identifier $(PKGID) \
		--version 1.0.0 \
		--install-location / \
		$(PKGNAME)
	@echo "Created installer: $(PKGNAME)"

run: all
	sudo ./$(SIGNED_BINARY)

.PHONY: all clean build sign run pkg
