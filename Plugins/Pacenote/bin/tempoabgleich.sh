#!/bin/bash

# Initialisiere Variablen für die Eingabe- und Ausgabepfade
inputDir=""
outputDir=""

# Parse Kommandozeilenargumente
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --in) inputDir="$2"; shift ;;
        --out) outputDir="$2"; shift ;;
        *) echo "Unbekanntes Argument: $1"; exit 1 ;;
    esac
    shift
done

# Überprüfe, ob die Pfade angegeben wurden
if [[ -z "$inputDir" || -z "$outputDir" ]]; then
    echo "Eingabe- und Ausgabepfade müssen angegeben werden."
    exit 1
fi

# CSV-Datei für die Ergebnisse
csvFile="$outputDir/änderungsliste.csv"

# Kopfzeile der CSV-Datei
echo "Name,Prozent,Millisekunden" > "$csvFile"

# Durchlaufe alle Dateien im 'input' Verzeichnis
for inputFile in "$inputDir"/*; do
    # Extrahiere den Dateinamen
    filename=$(basename "$inputFile")

    # Pfad zur entsprechenden Datei im 'output' Verzeichnis
    outputFile="$outputDir/$filename"

    # Prüfe, ob die Datei im 'output' Verzeichnis existiert
    if [[ -f "$outputFile" ]]; then
        # Ermittle die Dauer der Dateien
        inputDuration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$inputFile")
        outputDuration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$outputFile")

        # Berechne das benötigte Tempo
        tempo=$(echo "$inputDuration / $outputDuration" | bc -l)

        # Ursprüngliche und endgültige Dauer in Millisekunden
        originalDurationMs=$(echo "$outputDuration * 1000" | bc -l)
        finalDurationMs=$(echo "$inputDuration * 1000" | bc -l)

        # Differenz in Millisekunden
        differenceMs=$(echo "$finalDurationMs - $originalDurationMs" | bc -l)

        # Prozentuale Änderung
        percentChange=$(echo "($tempo - 1) * 100" | bc -l)

        # Schreibe die Daten in die CSV-Datei
        echo "$filename,$percentChange,$differenceMs" >> "$csvFile"
    else
        echo "Datei $outputFile existiert nicht."
    fi
done
