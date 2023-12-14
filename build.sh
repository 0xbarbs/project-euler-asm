dir=$1
file=dir/${dir}".asm"

nasm -f elf64 $dir/${dir}".asm"
ld $dir/${dir}".o" -o $dir/$dir -lc -dynamic-linker /usr/lib64/ld-linux-x86-64.so.2
[ "$2" == "-g" ] && gdb -q $dir/$dir || ./$dir/$dir