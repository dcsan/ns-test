#!/bin/sh
function MergeMetadataIfNecessary {
    local RAW_METADATA_DIR="$SRCROOT/Metadata/Metadata-$1"
    local METADATA_BINARY="$BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/metadata-$1.bin"

    if [ "$RAW_METADATA_DIR" -nt "$METADATA_BINARY" ]; then
        "$SRCROOT/Metadata/MetaMerge" "$RAW_METADATA_DIR" "$METADATA_BINARY" &>/dev/null
        return
    fi

    for f in "$RAW_METADATA_DIR"/*
    do
        if [ "$f" -nt "$METADATA_BINARY" ]; then
            "$SRCROOT/Metadata/MetaMerge" "$RAW_METADATA_DIR" "$METADATA_BINARY" &>/dev/null
            break
        fi
    done
}

MergeMetadataIfNecessary armv7
MergeMetadataIfNecessary arm64
