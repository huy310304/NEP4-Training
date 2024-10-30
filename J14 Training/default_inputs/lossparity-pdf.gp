set terminal postscript enhanced color font "arial,7"
set output "LossAndParity"
set multiplot layout 2,2
set size square
set key outside right
set xlabel "{/:Bold Generation/100}"
set ylabel "{/:Bold Loss}"
set logscale xy
set xtics rotate
plot "loss.out" u ($1/100):2 w l lw 1 lt 1 ti "Total","loss.out" u ($1/100):3 w l lw 1 lt 2 ti "L1","loss.out" u ($1/100):4 w l lw 1 lt 3 ti "L2","loss.out" u ($1/100):5 w l lw 1 lt 4 ti "Energy-Train","loss.out" u ($1/100):6 w l lw 1 lt 5 ti "Force-Train","loss.out" u ($1/100):7 w l lw 1 lt 6 ti "Virial-Train","loss.out" u ($1/100):8 w l lw 1 lt 7 ti "Energy-Test","loss.out" u ($1/100):9 w l lw 1 lt 8 ti "Force-Test","loss.out" u ($1/100):10 w l lw 1 lt 9 ti "Virial-Test"
unset logscale xy
set xlabel "{/:Bold DFT energy (eV/atom)}"
set ylabel "{/:Bold NEP energy (eV/atom)}"
#set xtics rotate
#set xr[-9:-6.5]
#set yr[-9:-6.5]
plot "energy_train.out" u 1:2 w p pt 7 ps 0.5 lc rgb "blue" ti "train","energy_test.out" u 1:2 w p pt 7 ps 0.5 lc rgb "green" ti "test",x w l lt 1 lw 1.5 lc rgb "red" noti
#set xtics norotate
#unset xr
#unset yr
set xlabel "{/:Bold DFT Force (eV/A)}"
set ylabel "{/:Bold NEP Force (eV/A)}"
plot "force_train.out" u 1:4 w p pt 7 ps 0.5 lc rgb "blue" ti "train","force_test.out" u 1:4 w p pt 7 ps 0.5 lc rgb "green" ti "test",x w l lt 1 lw 1.5 lc rgb "red" noti 
set xlabel "{/:Bold DFT virial (eV/atom)}"
set ylabel "{/:Bold NEP virial (eV/atom)}"
plot "virial_train.out" u 1:7 w p pt 7 ps 0.5 lc rgb "blue" ti "train","" u 2:8 w p pt 7 ps 0.5 lc rgb "blue" noti,"" u 3:9 w p pt 7 ps 0.5 lc rgb "blue" noti,"" u 4:10 w p pt 7 ps 0.5 lc rgb "blue" noti,"" u 5:11 w p pt 7 ps 0.5 lc rgb "blue" noti,"" u 6:12 w p pt 7 ps 0.5 lc rgb "blue" noti,"virial_test.out" u 1:7 w p pt 7 ps 0.5 lc rgb "green" ti "test","" u 2:8 w p pt 7 ps 0.5 lc rgb "green" noti,"" u 3:9 w p pt 7 ps 0.5 lc rgb "green" noti,"" u 4:10 w p pt 7 ps 0.5 lc rgb "green" noti,"" u 5:11 w p pt 7 ps 0.5 lc rgb "green" noti,"" u 6:12 w p pt 7 ps 0.5 lc rgb "green" noti,x w l lt 1 lw 1.5 lc rgb "red" noti
!ps2pdf "LossAndParity"
system("rm LossAndParity")

