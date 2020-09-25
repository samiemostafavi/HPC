#!/bin/bash

gcc -O3 -ftree-vectorize -fopt-info-vec-missed matrix_multiply_1000.c -o matrix_multiply_1000.out

echo "
-ftree-vectorize
Perform vectorization on trees. This flag enables -ftree-loop-vectorize and -ftree-slp-vectorize if not explicitly specified.

-ftree-loop-vectorize
Perform loop vectorization on trees. This flag is enabled by default at -O3 and by -ftree-vectorize, -fprofile-use, and -fauto-profile.

-ftree-slp-vectorize
Perform basic block vectorization on trees. This flag is enabled by default at -O3 and by -ftree-vectorize, -fprofile-use, and -fauto-profile.

-fvect-cost-model=model
Alter the cost model used for vectorization. The model argument should be one of ‘unlimited’, ‘dynamic’ or ‘cheap’. With the ‘unlimited’ model the vectorized code-path is assumed to be profitable while with the ‘dynamic’ model a runtime check guards the vectorized code-path to enable it only for iteration counts that will likely execute faster than when executing the original scalar loop. The ‘cheap’ model disables vectorization of loops where doing so would be cost prohibitive for example due to required runtime checks for data dependence or alignment but otherwise is equal to the ‘dynamic’ model. The default cost model depends on other optimization flags and is either ‘dynamic’ or ‘cheap’.

-fsimd-cost-model=model
Alter the cost model used for vectorization of loops marked with the OpenMP simd directive. The model argument should be one of ‘unlimited’, ‘dynamic’, ‘cheap’. All values of model have the same meaning as described in -fvect-cost-model and by default a cost model defined with -fvect-cost-model is used.

-O3
Optimize yet more. -O3 turns on all optimizations specified by -O2 and also turns on the following optimization flags:

-fgcse-after-reload 
-fipa-cp-clone
-floop-interchange 
-floop-unroll-and-jam 
-fpeel-loops 
-fpredictive-commoning 
-fsplit-loops 
-fsplit-paths 
-ftree-loop-distribution 
-ftree-loop-vectorize 
-ftree-partial-pre 
-ftree-slp-vectorize 
-funswitch-loops 
-fvect-cost-model 
-fvect-cost-model=dynamic 
-fversion-loops-for-strides

--param name=value
vect-max-version-for-alignment-checks
The maximum number of run-time checks that can be performed when doing loop versioning for alignment in the vectorizer.

vect-max-version-for-alias-checks
The maximum number of run-time checks that can be performed when doing loop versioning for alias in the vectorizer.

vect-max-peeling-for-alignment
The maximum number of loop peels to enhance access alignment for vectorizer. Value -1 means no limit.

min-vect-loop-bound
The minimum number of iterations under which loops are not vectorized when -ftree-vectorize is used. The number of iterations after vectorization needs to be greater than the value specified by this option to allow vectorization.

max-stores-to-sink
The maximum number of conditional store pairs that can be sunk. Set to 0 if either vectorization (-ftree-vectorize) or if-conversion (-ftree-loop-if-convert) is disabled.

vect-epilogues-nomask
Enable loop epilogue vectorization using smaller vector size.

vect-partial-vector-usage
Controls when the loop vectorizer considers using partial vector loads and stores as an alternative to falling back to scalar code. 0 stops the vectorizer from ever using partial vector loads and stores. 1 allows partial vector loads and stores if vectorization removes the need for the code to iterate. 2 allows partial vector loads and stores in all loops. The parameter only has an effect on targets that support partial vector loads and stores.

aarch64-sve-compare-costs
When vectorizing for SVE, consider using “unpacked” vectors for smaller elements and use the cost model to pick the cheapest approach. Also use the cost model to choose between SVE and Advanced SIMD vectorization.

Using unpacked vectors includes storing smaller elements in larger containers and accessing elements with extending loads and truncating stores.

-ftree-loop-if-convert
Attempt to transform conditional jumps in the innermost loops to branch-less equivalents. The intent is to remove control-flow from the innermost loops in order to improve the ability of the vectorization pass to handle these loops. This is enabled by default if vectorization is enabled.

About important derivatives:
https://monoinfinito.wordpress.com/series/vectorization-in-gcc/

Report:
-fopt-info-vec-missed 
-fopt-info-vec-all

About reports:
https://cvw.cac.cornell.edu/vector/compilers_reports

"
