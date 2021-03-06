#!/bin/bash

function publish {
  if [ ! -f "$POST_FILE" ]
  then
    echo "Post does not currently exist, did you mean [ create ] ?"
    exit 1
  fi

  FILE_SIZE=$(wc -c < "$POST_FILE")

  if [ $FILE_SIZE == 0 ]; then
    echo "Post exists but has no content, did you mean [ edit ] ?"
    exit 1
  fi

  if [ "$TITLE" ]
  then
    COMMIT_MESSAGE="'$TITLE'"
  else
    COMMIT_MESSAGE="$DATE"
  fi

  git add "$POST_FILE"

  GIT_STATUS=$(git status --porcelain "$POST_FILE")
  GIT_STATUS_CODE=${GIT_STATUS:0:1}

  case $GIT_STATUS_CODE in
    "A")
      git commit "$POST_FILE" --quiet -m "Add $COMMIT_MESSAGE post"
      ;;
    "M")
      git commit "$POST_FILE" --quiet -m "Edit $COMMIT_MESSAGE post"
      ;;
    "")
      # Handle for if !file is at top of this script already.
      echo "No changes made to '$POST_FILE_NAME' post, did you mean [ edit ] ?"
      git reset "$POST_FILE"
      exit 1
      ;;
    *)
      echo "Unexpected git status \"$GIT_STATUS_CODE\""
      git reset "$POST_FILE"
      exit 1
      ;;
    esac

  git push
}
