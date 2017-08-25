# ShellCode Randomizer

### INTRODUCTION :
ShellCode Randomizer est un outil permettant de chiffrer/obfusquer un shellcode malicieux.
Pour l'utiliser, vous devez préalablement avoir géneré un ShellCode valide ayant une synthaxe du type :
  
• unsigned char buf[] = 
  "\xbf\x8c\xe1\xb0\xa3\xde\xe4\xe0\x7a"
    
### Usage:
       sh shellcode.sh [-f] [Input] [-o] [Output] [-k] [Output keys] [-v]
       sh shellcode.sh [-h]

### Paramètres:
       [-h] Affiche l'aide.
       [-f] Obligatoire. Précède le fichier shellcode à obfusquer.
       [-o] Obligatoire. Précède le nom du fichier de sortie du shellcode.
       [-k] Obligatoire. Précède le nom du fichier de clés de sortie.
       [-v] Optionnel. Mode verbeux. Décrit toutes les actions en cours sur le shellcode et affiche les variables DEBUG
       [Input] Obligatoire. Nom et chemin jusqu'au fichier shellcode à obfusquer.
       [Output] Obligatoire. Nom et chemin du fichier shellcode de sortie.
       [Output keys] Obligatoire. Nom et chemin du fichier de clés de sortie.

### Exemples:
       sh shellcode.sh -f shellcode -o newShellcode -k keys
       sh shellcode.sh -f shellcode -o newShellcode -k keys -v
