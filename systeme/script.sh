#!/bin/bash

#afficher "Ou voulez-vous enregistrer le projet ?"
echo "Ou voulez-vous enregistrer le projet ?"
echo "(exemple : C:/dossier)"

#récupéré l'emplacement racide
read directory

#Afficher dans le terminal : Quel est le nom de votre projet ? 
echo "Quel est le nom de votre projet ?"

#récupéré le nom du projet
read project

#Se déplacer dans le dossier du projet
if cd "$directory"; then
    echo " Vous êtes dans $directory "
else
    echo "Erreur : Le dossier n'existe pas. Voulez-vous le créer ? (oui/non)" 
    read create_dir

    if [ "$create_dir" = "oui" ]; then
        mkdir "$directory"
        echo "Le dossier $directory a été créé."
        cd "$directory" || { echo "impossible de se déplacer dans le dossier $directory."; exit 1; }
    else
        echo "opération annulée."
        exit 1
    fi
fi

#Créer le dossier du projet
mkdir $project

#Créer les fichiers suivants dans le dossier projet (index.html, style.css readme.md)
touch "$project/index.html" "$project/style.css" "$project/readme.md"

#Afficher dans le terminal le projet a été ajouté.
echo "Le projet a été ajouté."