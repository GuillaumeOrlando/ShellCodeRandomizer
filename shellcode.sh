#!/bin/bash

clear
okegreen='\033[92m'
RESET="\033[00m" #normal


#Retourne le code hexa brute
# /!\ A OPTIMISER /!\
touch output
sed -e 's/"//g' shellcode > output
touch output1
sed -e 's/;//g' output > output1
sed -e 's/x//g' output1 > output
rm output1
sed 's@\\@@g' output > output1
rm output
sed '1d' output1 > rawHexa
cp rawHexa rawHexaBak
rm output1

#Récupère longueur de la chaine rawHexa + initialisation compteur 
lenghtRaw=$(wc -c rawHexa | cut -c -3)
#echo "DEBUG : lenghtRaw = $lenghtRaw"
lenght=$(($lenghtRaw/2))
#echo "DEBUG : lenght = $lenght"
n=0



#Prépare le fichier qui va contenir le shellcode modifié
touch finalShellCode
echo "unsigned char buf[] = " >> final
echo "int tab[] = {" >> keys
echo \" > finalShellCode

#Boucle
while [ $n != $lenght ]
do
#echo "DEBUG : n = $n"

#Avancement

pourcent1=$(($n*100))
pourcent=$(($pourcent1/$lenght)) 
clear
echo $okegreen " "
echo " • Traitement des données : $pourcent% \r\c"
echo $RESET " "

#Récupère deux premiers caractères shellcode brute, soit la première valeure hexa
hex=$(head -n 1 rawHexa | cut -c -2)
#echo "DEBUG : hex = $hex"

#Convertion de la valeure hexa en décimal
deci=$((0x${hex}))
#echo "DEBUG : decimal = $deci"

#Génère nombre aléatoire entre 1 et 9 avec urandom
alea=$(grep -m1 -ao '[1-9]' /dev/urandom | sed s/0/9/ | head -n1)
#echo "DEBUG : aléatoire = $alea"

#Additionne la valeur aléatoire avec le résultat de la conversion héxa
result=$(($deci + $alea))
if [ $result -ge 255 ]
then
    result=$deci
    alea=0
fi
#echo "DEBUG : résultat addition en décimal = $result"

#Stock le nombre aléatoire dans un fichier de clés
touch keys
echo $alea >> keys
if [ $n != $lenght ]
then
    echo "," >> keys
fi

#Suppression des sauts de lignes keys
tr -d '\n' < keys >> finalKeys
rm keys

#Conversion de la nouvelle valeur décimal en héxa + ajout dans le fichier final
finalHex=$(printf '%x\n' $result)
#echo "DEBUG : résultat addition en héxa = $finalHex"
echo "\\x" >> finalShellCode
echo $finalHex >> finalShellCode

#Suppression des sauts de lignes output
tr -d '\n' < finalShellCode >> final
rm finalShellCode
#echo "DEBUG : résultat final =" && cat final
#echo ""
#echo "DEBUG : rawHexa =" && cat rawHexa
#echo ""
#echo ""


#Supprime 2 premiers caractères de la chaine rawHexa
supp=$(cat rawHexa | cut  -b 3-)
echo $supp > rawHexa

#Incrémente compteur
n=$(($n+1))

#Fin Boucle
done

#Ajout synthaxe c buf[]
echo -n \" >> final
echo -n ";" >> final
sup=$(sed '$ s/.$//' finalKeys)
echo $sup > finalKeys


#Affichage final
echo $okegreen " "
echo "• Nombre de caractères convertis : $lenght"
echo ""
echo "• Fichier initial : "
echo $RESET " "
cat shellcode
echo $okegreen " "
echo "• Fichier initial brute : "
echo $RESET " "
cat rawHexaBak
echo $okegreen " "
echo "• Fichier modifiée : "
echo $RESET " "
cat final
echo ""
echo $okegreen " "
echo "• Clés : "
echo $RESET " "
cat finalKeys
echo ""
echo ""

#DEBUG
rm rawHexa
rm rawHexaBak