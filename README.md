# Peformance-Study-of-Modern-JVM-GCs

In this project, we studied the performance of JVM based three modern garbage collectors: Shenandoah, ZGC and G1. The tests are performed on JDK 11.0.15. We chose benchmark datasets from Renaissance (https://www.dacapobench.org/) and DaCapo (https://www.dacapobench.org/) benchmark suites. The datasets are run on the JDK by varying the garbage collectors and the log files are analyzed using the GCEasy (https://gceasy.io/) tool. We also varied heap sizes for the Renaissance benchmark datasets. 

To run after varying heap sizes, the script-heap.sh script (inside the "Heap_size_varying" folder) with the heapsize and benchmark directory as arguments. For more instructions, please refer to the Report.pdf file.
