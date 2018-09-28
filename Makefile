PREFIX?=/usr/local

PACKAGE_NAME=swift-syntax-check
RELEASE_BIN=.build/release/Main

build:
		swift build -c release -Xswiftc -static-stdlib

install: build
		mkdir -p "$(PREFIX)/bin"
		cp -f "${RELEASE_BIN}" "$(PREFIX)/bin/${PACKAGE_NAME}"
