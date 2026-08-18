; https://llvm.org/docs/LangRef.html
; https://github.com/simon-or-something/Collect-Avoid1.rkt

declare void @InitWindow(i32, i32, ptr) nounwind
declare i1 @WindowShouldClose() nounwind
declare void @BeginDrawing() nounwind
declare void @EndDrawing() nounwind

@rlcolour = constant type {i8, i8, i8, i8}

define i32 @main() {
  %title = alloca i8, i32 9, align 16 ; rayllibvm
  store [10 x i8] c"rayllibvm\00", ptr %title
  call void @InitWindow(i32 640, i32 360, ptr %title)
  br label %should_window_close

should_window_close:
  %swincls_res = call i1 @WindowShouldClose()
  br i1 %swincls_res, label %else, label %window_active

window_active:
    call void @BeginDrawing()
    call void @EndDrawing()
    br label %should_window_close

else:
  ret i32 0
}

