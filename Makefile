doc:
	test -d bin || mkdir bin
	test -f bin/mdbook || curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.27/mdbook-v0.4.27-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=bin
	bin/mdbook build docs --open