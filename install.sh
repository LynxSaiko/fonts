#!/bin/bash
# move-all-fonts.sh
# Script untuk memindahkan semua folder font ke /usr/share/fonts/X11/TTF

SOURCE="/web1/fonts/fonts"
TARGET="/usr/share/fonts/X11/TTF"

# Cek apakah folder sumber ada
if [ ! -d "$SOURCE" ]; then
    echo "Error: Direktori $SOURCE tidak ditemukan!"
    exit 1
fi

# Buat folder target jika belum ada
echo "Membuat direktori target $TARGET ..."
sudo mkdir -p "$TARGET"

# Copy semua font
echo "Meng-copy semua font dari $SOURCE ke $TARGET ..."
sudo cp -rv "$SOURCE"/* "$TARGET"/

# Update cache font
echo "Meng-update font cache ..."
sudo fc-cache -fv "$TARGET"

echo "=== Selesai! ==="
echo "Cek font terinstall dengan: fc-list | less"
