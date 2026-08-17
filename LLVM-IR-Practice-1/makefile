%.s : %.ll
	@#llc-18 $^ -o $@
	clang -c -S $^ -o $@

%.o : %.s
	@#llvm-mc-18 -filetype=obj $^ -o $@
	clang -c $^ -o $@

% : %.o
	@# linking per hand makes this so crap
	clang $^ -o $@ -L/home/simon-or-something/Documents/GitHub/raylib/build/raylib/ -l:libraylib.a -lm
