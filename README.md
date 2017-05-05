# Sen

![Sen waving](image.gif)

Inspired by the simplicity of John Carmack's [.plan files](https://github.com/oliverbenns/john-carmack-plan). [Sen](https://github.com/oliverbenns/sen) aims to create a minimalist blog for developers all within a Git repo. It prevents the need to worry about updates, style, management and longevity so they can focus purely on what's important: the message.

Each post is a markdown file, named by creation date. Markdown was chosen as it offers minimal formatting. It is more sophisticated than plain text, but not to the point where the author has to worry about semantics. Similar to Carmack's posts, they aren't intended to be long essays - just quick, simple logs.

This post structure outputs like this:

- posts
  - 2016
    - 2016-01-01 - Hello World.md
    - 2016-01-02.md
  - 2017
    - 2017-01-01 - A New Year.md
    - 2017-01-02.md

## Getting Started

1. First steps require you to have the bash scripts and correct structure. You can do this by either:
  - Cloning this repo
  - Copy + paste the shell files (keeping the structure of course)
2. Change the `EDIT_CMD` variable to be the command you use to open your editor. `atom` / `vi` / `emacs` etc.

## Publishing
Command looks like this: `sh sen.sh [task] [title]`.

### `[task]`

- **create** - This creates the post file and opens up your favourite editor.
- **publish** - This will push your new or edited file to your remote branch with a neat commit message.
- **edit** - Started a post but forgot to publish? Maybe you published but have noticed some typos? This task will open up your post in your editor. Remember to run the publish task again once you've made your updates.

### `[title]`

- Optional
- When title supplied, file will be `1970-01-01 - Hello World.md`
- When title not supplied, file will be `1970-01-01.md`

## Contributing
This project would love contributions! I'm trying to keep this as minimal as possible so adding new features isn't a high priority. Things that come to mind that are desirable:

- Linux / Windows support
  - These OS' haven't been tested at all, with Bash being Bash, I imagine there's a few bugs.
- Ability to add images and save them within repo.
  - Only images currently supported are remote images.
  - In `./media` folder? Inside each year folder or in root?
  - Would this require parsing the Markdown for images?
- Support quotation marks and special characters in title. `'"<>`
