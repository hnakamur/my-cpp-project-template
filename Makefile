CXX = clang++-16
CLANG_FORMAT = clang-format-16

install: test
	sudo cmake --build build --config Release --target install -v

test: build
	cmake --build build --target test

build:
	if [ ! -d build ]; then \
	CXX=$(CXX) cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=$(CLANG_FORMAT); \
	fi
	cmake --build build -v

debug-test: debug-build
	cmake --build debug-build --target test

debug-build:
	if [ ! -d debug-build ]; then \
	CXX=$(CXX) cmake -B debug-build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCLANG_FORMAT=$(CLANG_FORMAT); \
	fi
	cmake --build debug-build -v

cmake-format:
	find . -path ./build -prune -false -o \( -name CMakeLists.txt -o -name '*.cmake' \) \
	| xargs --verbose cmake-format -i

clean:
	@rm -rf build debug-build

.PHONY: install build debug-build test cmake-format clean
