all: go rust binlog c++

go:
	./generate-go.sh

rust:
	./generate-rust.sh

binlog:
	./generate-binlog.sh

c++:
	./generate-cpp.sh
