benchmark=$1
mkdir $benchmark
declare -a heap_size=(1000 1250 1500 1750 2000)
#declare -a heap_size=(1250 1500)

for size in "${heap_size[@]}"
do
#echo "${size}"
java -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC -Xmx${size}M -Xlog:gc*:file=shgc_$benchmark_${size}.log -jar renaissance-mit-0.14.0.jar $benchmark -r 2
java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xmx${size}M -Xlog:gc*:file=zgc_$benchmark_${size}.log -jar renaissance-mit-0.14.0.jar $benchmark -r 2
java -XX:+UseG1GC -Xmx${size}M -Xlog:gc*:file=g1gc_$benchmark_${size}.log -jar renaissance-mit-0.14.0.jar $benchmark -r 2

mv shgc_$benchmark_${size}.log $benchmark
mv zgc_$benchmark_${size}.log $benchmark
mv g1gc_$benchmark_${size}.log $benchmark
done
