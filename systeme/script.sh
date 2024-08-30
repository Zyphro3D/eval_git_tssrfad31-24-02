#!/bin/bash

#afficher "Ou voulez-vous enregistrer le projet ?"
echo "Ou voulez-vous enregistrer le projet ?"
echo "(exemple : C:/dossier)"

#récupéré l'emplacement racide
read -r directory

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
        mkdir -p "$directory"
        echo "Le dossier $directory a été créé."
        cd "$directory" || { echo "impossible de se déplacer dans le dossier $directory."; exit 1; }
    else
        echo "opération annulée."
        exit 1
    fi
fi

# Vérifier si le dossier du projet existe déja
if [ -d "$project" ]; then
    echo "Le projet $project existe déjà. Que voulez-vous faire ?"
    echo "1) Remplacer le projet"
    echo "2) Changer de nom"
    echo "3) Annuler l'opération"
    read choice

    case $choice in
        1)
            rm -rf "$project"
            echo "Le dossier $project a été remplacé."
            ;;
        2)
            echo "Veuillez entrer un nouveau nom pour le projet :"
            read new_project
            project=$new_project
            while [ -d "$project" ]; do
                echo "Le projet $project existe déjà. Veuillez choisir un autre nom :"
                read project
            done
            ;;
        3)
            echo "Opération annulée."
            exit 1
            ;;
        *)
            echo "Choix annulé. Opération annulée."
            exit 1
            ;;
    esac
fi



#Créer le dossier du projet
mkdir $project

#Créer les fichiers suivants dans le dossier projet (index.html, style.css readme.md)
touch "$project/index.html" "$project/style.css" "$project/readme.md"

#Afficher dans le terminal le projet a été ajouté.
echo "Le projet a été ajouté."