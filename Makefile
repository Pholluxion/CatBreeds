#Flutter command 
FLUTTER = flutter
#Dart command
DART = dart

# Clean dependencies
clean:
	$(FLUTTER) clean

# Get dependencies
deps:
	$(FLUTTER) pub get

# Sort imports
sort_imports:
	$(DART) run import_sorter:main --no-comments

# Generate code
build:
	$(DART) run build_runner build --delete-conflicting-outputs
# Generate code and watch for changes
watch:
	$(DART) run build_runner watch --delete-conflicting-outputs

# Clean build files
clean_build:
	rm -rf .dart_tool/build
	rm -rf build
	$(FLUTTER) clean
	$(FLUTTER) pub get

# Run tests
test:
	$(FLUTTER) test --coverage

# Generate coverage report and open in browser
coverage:
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

# Format code and analyze
lint:
	$(FLUTTER) format .
	$(FLUTTER) analyze

# Continuous Integration
ci: clean_build deps sort_imports build test

# Run debug mode
debug:
	$(FLUTTER) run --dart-define-from-file=.env

release:
	$(FLUTTER) build apk --dart-define-from-file=.env --release

# Declare phony targets
.PHONY: deps sort_imports build watch clean_build test coverage lint ci debug release clean
