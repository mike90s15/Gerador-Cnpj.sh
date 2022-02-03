#!/bin/bash
function _cnpj()
{
    while :; do
	cnpj=$(($RANDOM*99999988))
	#cnpj=${cnpj:0:8}000${cnpj:11:1}
	cnpj=${cnpj:0:8}0001
	(($(echo $cnpj | wc -L) == 12)) && break
    done
    num=5	
    for i in {0..11}; do
	soma=$((soma+(${cnpj:${i}:1}*num)))
	((num--))
	((num < 2)) && num=9
    done
    soma=$((soma%11))
    ((soma > 2)) && soma=$((11-soma)) || soma=0   
    cnpj=$cnpj$soma
    num=6
    for i in {0..12}; do
	soma1=$((soma1+(${cnpj:${i}:1}*num)))
        ((num--))
        ((num < 2)) && num=9
    done  
    soma1=$((soma1%11))
    ((soma1 > 2)) && soma1=$((11-soma1)) || soma1=0
    cnpj=$cnpj$soma1
    echo CNPJ: $cnpj
    echo CPNJ: ${cnpj:0:2}.${cnpj:2:3}.${cnpj:5:3}/${cnpj:8:4}-${cnpj:12:2}
}
_cnpj
