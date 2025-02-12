# SYNTAX TEST "source.ispc"

#include "header.isph"
# ^ meta.preprocessor.ispc keyword.control.import.ispc
#        ^ string.quoted.double.ispc

#ifdef FEATURE
# ^ meta.preprocessor.ispc keyword.control.import.ispc
#define FEATURE_VAL 1
#       ^ meta.preprocessor.ispc constant.other.ispc
#                   ^ source.ispc meta.preprocessor.ispc constant.numeric.integer.decimal.ispc
#else
# ^ meta.preprocessor.ispc keyword.control.import.ispc
#endif
# ^ meta.preprocessor.ispc keyword.control.import.ispc

// Single line comment
# ^ comment.line.double-slash.ispc

/* Multi-line
   comment */
# ^ comment.block.ispc

"Regular string"
# ^ string.quoted.double.ispc
"String with \n escape"
#            ^ constant.character.escape.ispc

'c'
# ^ string.quoted.single.ispc
L"Wide string"
# ^ string.quoted.double.ispc

// Numbers
123
# ^ constant.numeric.integer.decimal.ispc
0xFF
# ^ constant.numeric.hexadecimal.ispc
0b1010
# ^ constant.numeric.binary.ispc
1.234
# ^ constant.numeric.float.decimal.ispc
1.234f
# ^ constant.numeric.float.decimal.ispc
1.234e-10
# ^ constant.numeric.float.scientific.ispc
0x1.5p-3
# ^ constant.numeric.hexadecimal.ispc

// Keywords and control structures
if (condition) {
#^ keyword.control.ispc
}
foreach_active (i = 0 ... count) {
# ^ keyword.control.ispc
    continue;
#   ^ keyword.control.ispc
}

// Storage types and modifiers
uniform int x;
# ^ storage.modifier.ispc
#       ^ storage.type.ispc
varying float y;
# ^ storage.modifier.ispc
#       ^ storage.type.ispc

// Operators
x = a + b;
#     ^ keyword.operator.arithmetic.ispc
y *= 2;
# ^ keyword.operator.assignment.ispc
z = x >> 1;
#     ^ keyword.operator.bitwise.ispc
result = (a && b) || c;
#           ^ keyword.operator.logical.ispc
#                 ^ keyword.operator.logical.ispc

// Function declarations
export void kernelFunc(uniform int width, varying float* data) {
# ^ storage.modifier.ispc
#      ^ storage.type.ispc
#           ^ entity.name.function.ispc
#                      ^ storage.modifier.ispc
}

task void parallel_task(uniform int start, uniform int end) {
# ^ keyword.control.ispc
#    ^ storage.type.ispc
#         ^ entity.name.function.ispc
}

// Launch/sync
launch[10000] x(f);
sync;

// Intrinsics and pragmas
@llvm.sqrt.f32
# ^ support.function.intrinsic.ispc

#pragma unroll 4
# ^ meta.preprocessor.pragma.ispc
#       ^ keyword.control.pragma.ispc

// Constants
true
# ^ constant.language.ispc
false
# ^ constant.language.ispc
NULL
# ^ constant.language.ispc
programIndex
# ^ constant.language.ispc

// Function pointers
uniform int (*funcPtr)(varying float x);
# ^ storage.modifier.ispc
#       ^ storage.type.ispc
#           ^ meta.function.pointer.ispc
#                         ^ storage.modifier.ispc

// Operator overloading
operator+(uniform Vec3 a, uniform Vec3 b) uniform {
# ^ entity.name.function.operator.ispc
    return create(a.x + b.x, a.y + b.y, a.z + b.z);
}

// Templates - Comprehensive Test
// Template function declaration
template<typename T>
# ^ storage.modifier.ispc
#        ^ storage.modifier.ispc
void templateFunc(T value) {
#    ^ entity.name.function.ispc
}