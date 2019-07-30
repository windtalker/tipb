#!/bin/bash

rm -rf proto-cpp && mkdir -p proto-cpp
rm -rf cpp/tipb && mkdir cpp/tipb

cp proto/* proto-cpp/

function sed_inplace()
{
    if [ `uname` == "Darwin" ]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

sed_inplace '/gogo.proto/d' proto-cpp/*
sed_inplace '/option\ (gogoproto/d' proto-cpp/*
sed_inplace -e 's/\[.*gogoproto.*\]//g' proto-cpp/*

cd proto-cpp
echo "generate cpp code..."
protoc --cpp_out=../cpp/tipb/ *.proto
cd ..

rm -rf proto-cpp && rm -rf build_cpp && mkdir build_cpp && cd build_cpp && cmake ../cpp && make && cd .. && rm -rf build_cpp
