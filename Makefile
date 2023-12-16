CXX = clang++-16
CLANG_FORMAT = clang-format-16

build: setup
	cmake --build build --config Release -v

test: build
	cmake --build build --config Release --target test -v

install: test
	sudo cmake --build build --config Release --target install -v

debug_build: setup
	cmake --build build --config Debug -v

debug_test: debug_build
	cmake --build build --config Debug --target test -v

setup:
	if [ ! -d build ]; then \
	CXX=$(CXX) cmake -B build -G "Ninja Multi-Config" -DCLANG_FORMAT=$(CLANG_FORMAT); \
	fi

cmake_format:
	cmake --build build --config Release --target cmake_format -v

clean:
	@rm -rf build

.PHONY: install build debug_build setup test clean
