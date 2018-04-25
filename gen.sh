#!/bin/bash

NAME="$1"
TYPE="$2"

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

echo "mkdir $NAME"
mkdir "$NAME"

echo "Create index.js"
echo "$indexJS" >> "$NAME/index.js"

echo "Create $NAME/$NAME.$TYPE.js"
echo "$fileJS" >> "$NAME/$NAME.$TYPE.js"
