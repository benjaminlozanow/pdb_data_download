#!/bin/bash

##################################################################
# Adapted script from: 
# https://github.com/deepmind/alphafold/blob/main/scripts/download_pdb_mmcif.sh
# Description: Unzips and flattens files from the PDB (mmCIFs for AlphaFold).
# Example: ./unzip_flatten.sh absolute/path/to/the/downloaded/directory/mmCIF
####################################################################
# 
#
# Usage: bash download_pdb_mmcif.sh /path/to/download/directory
set -e

if [[ $# -eq 0 ]]; then
    echo "Error: download directory must be provided as an input argument."
    exit 1
fi

if ! command -v aria2c &> /dev/null ; then
    echo "Error: aria2c could not be found. Please install aria2c (sudo apt install aria2)."
    exit 1
fi

if ! command -v rsync &> /dev/null ; then
    echo "Error: rsync could not be found. Please install rsync."
    exit 1
fi

DOWNLOAD_DIR="$1"
ROOT_DIR="${DOWNLOAD_DIR%/*}/data"
RAW_DIR="${ROOT_DIR}/raw"
FILES_DIR="${ROOT_DIR}/files"

mkdir -p "${RAW_DIR}"
mv "${DOWNLOAD_DIR}"/* ${RAW_DIR}

echo "Unzipping files..."
find "${RAW_DIR}/" -type f -iname "*.gz" -exec gunzip {} +

echo "Flattening files..."
mkdir -p "${FILES_DIR}"
find "${RAW_DIR}" -type d -empty -delete  # Delete empty directories.
for subdir in "${RAW_DIR}"/*; do
  mv "${subdir}/"*.* "${FILES_DIR}"
done

echo "Deleting empty folders..."
rm -r $RAW_DIR
rm -r $DOWNLOAD_DIR

# Uncomment if you are trying to download de mmCIF data for alphafold
# aria2c "ftp://ftp.wwpdb.org/pub/pdb/data/status/obsolete.dat" --dir="${ROOT_DIR}"
