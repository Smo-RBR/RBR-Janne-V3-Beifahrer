#!/bin/bash
cd tts-out/
# Verzeichnis für die Ausgabedateien erstellen, falls es nicht existiert
mkdir -p vorbis

# Schleife durch alle .aiff Dateien im aktuellen Verzeichnis
for file in *.aiff; do
    # Basisname ohne Erweiterung extrahieren
    base=$(basename "$file" .aiff)

    # Konvertierung durchführen
    ffmpeg -i "$file" -ar 11025 -af "highpass=f=350, \
        treble=g=11:f=1000, \
        equalizer=f=1000:width_type=q:width=2:g=-3, \
        acompressor=threshold=-20dB:ratio=2:attack=50:release=1000, \
        alimiter=level_in=4.9:level_out=1.2:limit=0.9" \
        "vorbis/${base}.ogg"
done
