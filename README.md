# ShellCode Randomizer
### INTRODUCTION :
ShellCode Randomizer est un outil permettant de chiffrer/obfusquer un shellcode malicieux.
Pour l'utiliser, vous devez préalablement avoir géneré un ShellCode valide ayant une synthaxe du type :
  
• unsigned char buf[] = 
  "\xbf\x8c\xe1\xb0\xa3\xde\xe4\xe0\x7a"
    
### SYNOPSIS :
Le script retourne deux fichiers : 
• le premier [FINAL] comportant le shellcode obfusqué
• le deuxième [FINALKEYS] comportant les clés de déchiffrements
                                     
Il est ensuite facile d'ajouter ce shellcode dans un fichier C, sans que celui-ci ne trigger les analyse par signatures des AV

Les clés sont génerées aléatoirements, et vont de 1 à 9
Soit un total de 81 signatures différentes uniquement pour le code d'exemple ci-dessus !
Ou 4212 signatures différentes pour un reverse_tcp chiffré 5x en Shikata_ga_nai

### UTILISATION :
• sh shellcode.sh [FICHIER]
Le shellcode doit impérativement être renommé "shellcode"
                                                                    
                                                                                                  H0m4rd-B0y
#  SilentThunderStorm
### Introduction :

SilentThunderStorm se présente comme une suite de scripts permettant de génerer des payloads FUD.

Que ce soit via la géneration de simples payloads, ou via l'importation de payloads customs, SilentThunderStorm met à disposition des outils permettants un 
encodage basique, du multi encodage avec templates personnalisées, du cryptage, de l'intégration au sein d'applications légitimes, de l'assemblage, du déssassemblage, de la compilation et de l'analyse de payloads.

Des techniques avancées sont égallement intégrées, tel que la modification automatique de signatures, et un guide intéractif step-by-step pour les évasions d'antivirus les plus poussées.
SilentThunderStorm permet aussi de rendre les exploits meterpreter indétéctables, ou de créer des scripts additionnels personnalisés !

### TimeLine :

• Structure de base en bash [✔]

• Génerer des payloads customs windows [✔]

• Isoler signature payload [✔]

• Chiffrer manuellement un ShellCode [✔]

• Assistant à la géneration de payloads FUD [en cours]

• Isoler signature d'un custom payload [✘]

• Gestion de l'encodage sur les payloads customs [débug]

• Génerer les listeners relatifs aux payloads [débug]

• Vérifier dépendances/packets au lancement [✘]

• Génerer automatiquement des payloads "types" [✘]

• Désassemblage [✘]

• Assemblage [✔]

• Intégration dans exe légitimes [✘]

• Modiffier signature step-by-step [✔]
