## Building

Problems can be compiled by using the `build.sh` file in the root of the repository.

```sh
./build.sh problem-1
./build.sh problem-2
./build.sh problem-3
...
```

Optionally you can pass a `-g` flag to load the compiled binary into `gdb`.

```sh
./build.sh problem-1 -g
```