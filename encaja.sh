#!/bin/sh
#PBS -q cpa
#PBS -l nodes=1,walltime=10:00
#PBS -j oe
#PBS -d .
#PBS -o out.txt
rm out.txt
HILOSMIN=1
HILOSMAX=5
export OMP_NUM_THREADS=$HILOSMIN
echo $OMP_NUM_THREADS
ERROR="Ejecución fallida"
TARGETS=(encaja-e2-pi encaja-e2-pj encaja-e2-px encaja-e4-pi encaja-e4-pj encaja-e4-px)
echo "-- Resultados secuenciales --"
echo "encaja-e1:"
./encaja-e1 -t || echo "$ERROR"
echo "encaja-e3:"
./encaja-e3 -t || echo "$ERROR"
for i in $(seq $HILOSMIN $HILOSMAX); do
 echo -e "\n"
 echo "----------------------------------------------------------------"
 echo "-                      Con $i hilos                            -"
 echo "----------------------------------------------------------------"
 export OMP_NUM_THREADS=$i
 for f in ${TARGETS[@]}; do
 echo "  $f:"
 ./$f -t || echo "$ERROR"
 done
done
