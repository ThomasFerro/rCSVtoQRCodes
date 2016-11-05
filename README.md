# rCSVtoQRCodes

- English
    - Presentation
    - Quick start
    - Used libraries
- Français
    - Présentation
    - Démarrage rapide
    - Librairies utilisées

# English

## Presentation

rCSVtoQRCodes is a Ruby script generating QRCode based on data from CSV files.

## Quick start

Prerequisites :
- A directory containing 
    - A *csv* directory with all your **CSV** files;
    - The exe **rCSVtoQRCodes.exe**

Run the *.exe* file. A *png* directory will be created and, within this directory, one sub-directory will be added from every **CSV** file.
Within these sub-directory, one **PNG** image will be created by line in the current **CSV**. The name of these **PNG** are generated using the firsts two data in each line. 

## Used libraries

rCSVtoQRCodes use the following Ruby libraries :
- **Fileutils** for directory and file management;
- A custom **rCSVReader** for extracting data from **CSV** file (Warning : It's not meant to be reuse in another project);
- [**DCarper**'s **rqrcode_png**](https://github.com/DCarper/rqrcode_png) for generate QRCode in **PNG**.

# Français 

## Présentation

rCSVtoQRCodes est un script Ruby générant des QRCode à partir de données inscrites dans des fichiers **CSV**.

## Démarrage rapide

Prérequis :
- Un dossier contenant :
    - Un dossier *csv* avec vos fichiers à encoder; 
    - L'exécutable **rCSVtoQRCodes.exe**. 

Lancez l'exécutable, un dossier *png* est créé. Dans ce dossier, un sous-dossier par fichier **CSV** est créé.

Une image au format **PNG** est générée par ligne. Ces images ont pour nom les deux premiers champs du **CSV** séparés par un underscore.

## Librairies utilisées

rCSVtoQRCodes utilise les librairies Ruby suivantes :
- **Fileutils** pour la gestion des dossiers et des fichiers;
- La librairie créée pour l'occasion **rCSVReader**, pour l'extraction de données depuis un fichier **CSV** (Attention : cette librairie n'a pas pour but d'être réutilisée ni réutilisable);
- [La librairie de **DCarper**, **rqrcode_png**](https://github.com/DCarper/rqrcode_png), pour la génération des QRCode au format **PNG**.