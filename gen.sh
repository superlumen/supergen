#!/bin/bash

NAME="$1"
TYPE="$2"
TYPE_DIR="${TYPE}s"

################################################################################
# Setup the variables
################################################################################

indexJS="// @flow

export * from \"./$NAME.$TYPE\"
export { default } from \"./$NAME.$TYPE\"
"

# echo "$indexJS"

reactJS="// @flow

import React from \"react\";

const $NAME = () => {
  return <div>$NAME</div>;
};

export default $NAME;
"

# echo "$reactJS"

serviceJS="// @flow
"

# echo "$serviceJS"

case "$TYPE" in
  "service") fileJS="$serviceJS" ;;
  *) fileJS="$reactJS" ;;
esac

################################################################################
# Create the directories and files
################################################################################

echo "mkdir -p $TYPE_DIR"
mkdir -p "$TYPE_DIR"

echo "mkdir $TYPE_DIR/$NAME"
mkdir "$TYPE_DIR/$NAME"

echo "Create $TYPE_DIR/$NAME/index.js"
echo "$indexJS" >> "$TYPE_DIR/$NAME/index.js"

echo "Create $TYPE_DIR/$NAME/$NAME.$TYPE.js"
echo "$fileJS" >> "$TYPE_DIR/$NAME/$NAME.$TYPE.js"
