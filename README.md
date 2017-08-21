# ShellCode Randomizer
###[INTRODUCTION]
ShellCode Randomizer est un outil permettant de chiffrer/obfusquer un shellcode malicieux.
Pour l'utiliser, vous devez préalablement avoir géneré un ShellCode valide ayant une synthaxe du type :
  
unsigned char buf[] = 
  "\xbf\x8c\xe1\xb0\xa3\xde\xe4\xe0\x7a"
    
###[SYNOPSIS]
Le script retourne deux fichiers : le premier [FINAL] comportant le shellcode obfusqué
                                   le deuxième [FINALKEYS] comportant les clés de déchiffrements
                                     
Il est ensuite facile d'ajouter ce shellcode dans un fichier C, sans que celui-ci ne trigger les analyse par signatures des AV

Les clés sont génerées aléatoirements, et vont de 1 à 9
Soit un total de 81 signatures différentes uniquement pour le code d'exemple ci-dessus !
Ou 4212 signatures différentes pour un reverse_tcp chiffré 5x en Shikata_ga_nai

###[UTILISATION]
sh shellcode.sh [FICHIER]
Le shellcode doit impérativement être renommé "shellcode"
                                                                    
                                                                                                        H0m4rd-B0y
