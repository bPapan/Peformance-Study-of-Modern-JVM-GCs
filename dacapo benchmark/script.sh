#java -XX:+UseShenandoahGC -Xlog:gc -Xmx2G -Xms2G -XX:+AlwaysPreTouch -jar dacapo-9.12-MR1-bach.jar xalan


benchmark=$1

java -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC -Xlog:gc*:file=shgc_$benchmark.log -jar dacapo-9.12-MR1-bach.jar $benchmark
java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xlog:gc*:file=zgc_$benchmark.log -jar dacapo-9.12-MR1-bach.jar $benchmark
java -XX:+UseG1GC -Xlog:gc*:file=g1gc_$benchmark.log -jar dacapo-9.12-MR1-bach.jar $benchmark

mkdir $benchmark
mv shgc_$benchmark.log $benchmark
mv zgc_$benchmark.log $benchmark
mv g1gc_$benchmark.log $benchmark