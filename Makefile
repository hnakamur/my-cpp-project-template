CXX = clang++-16
CLANG_FORMAT = clang-format-16

install: test
	sudo cmake --build build --config Release --target install -v

test: build
	cmake --build build --config Release --target test -v

build: setup
	cmake --build build --config Release -v

debug-test: debug-build
	cmake --build build --config Debug --target test -v

debug-build: setup
	cmake --build build --config Debug -v

setup:
	if [ ! -d build ]; then \
	CXX=$(CXX) cmake -B build -G "Ninja Multi-Config" -DCLANG_FORMAT=$(CLANG_FORMAT); \
	fi

cmake-format:
	find . -path ./build -prune -false -o \( -name CMakeLists.txt -o -name '*.cmake' \) \
	| xargs --verbose cmake-format -i

clean:
	@rm -rf build

.PHONY: install build debug-build setup test cmake-format clean
