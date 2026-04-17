# Articles

This is the repo containing all my articles i have on my blog ![julienlargetpiet.tech](https://julienlargetpiet.tech)

`import.sh`

Allows to locally import the articles creating this sheme:

```
articles_imported
    | 01-article1
        | 01-article1.md <-- actual content
        | metdatada.txt <-- metadata for this article
    | 02-article2
        ...
    | 03-article3
        ...
    ...

.statix_articles.json <-- contains all metadata of all articles use for 'stx' CLI with nicknames handle
```

This works after you set up the Statix CLI.

Now, you can just:

```
$ cd articles_imported/my-article
```

And do some works in that folder.

[https://github.com/julienlargetpiet/Statix](https://github.com/julienlargetpiet/Statix)
