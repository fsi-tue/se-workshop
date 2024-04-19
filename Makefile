doc:

	test -d bin || mkdir bin
	test -f bin/mdbook || curl -sSL https://github.com/rust-lang/mdBook/releases/download/v0.4.27/mdbook-v0.4.27-x86_64-unknown-linux-gnu.tar.gz | tar -xz --directory=bin
	test -f bin/mdbook-mermaid || curl -sSL https://github.com/badboy/mdbook-mermaid/releases/download/v0.13.0/mdbook-mermaid-v0.13.0-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C bin
	bin/mdbook build docs --open
