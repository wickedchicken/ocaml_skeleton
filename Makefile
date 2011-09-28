main-native:
	ocamlbuild -I src/ main.native
	@cp `readlink main.native` bin/main.native
	@rm main.native

main:
	ocamlbuild -I src/ main.byte
	@cp `readlink main.byte` bin/main.byte
	@rm main.byte

tests-native:
	ocamlbuild -I src/ -tag pkg_oUnit tests.native
	@cp `readlink tests.native` bin/tests.native
	@rm tests.native
	bin/tests.native
	@echo

tests:
	ocamlbuild -I src/ -tag pkg_oUnit tests.byte
	@cp `readlink tests.byte` bin/tests.byte
	@rm tests.byte
	bin/tests.byte
	@echo

clean:
	-rm -rf _build/ bin/*

.PHONY: main-native main tests-native tests clean
