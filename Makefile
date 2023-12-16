CXX = clang++-16
CLANG_FORMAT = clang-format-16

build: setup
	cmake --build build --config Release -v

test: build
	cmake --build build --config Release --target test -v

install: test
	sudo cmake --build build --config Release --target install -v

debug-build: setup
	cmake --build build --config Debug -v

debug-test: debug-build
	cmake --build build --config Debug --target test -v

setup:
	if [ ! -d build ]; then \
	CXX=$(CXX) cmake -B build -G "Ninja Multi-Config" -DCLANG_FORMAT=$(CLANG_FORMAT); \
	fi

clean:
	@rm -rf build

.PHONY: install build debug-build setup test clean
