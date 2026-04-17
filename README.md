## Articles

This is the repo containing all my articles i have on my blog [julienlargetpiet.tech](https://julienlargetpiet.tech)

```bash
bash import_articles.sh -o ~/MyBlog
```

OR

```bash
chmod +x import_articles.sh
sudo cp import_articles.sh /usr/local/bin/.
import_articles.sh -o ~/MyBlog
```

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
$ cd ~/MyBlog/articles_imported/my-article
```

And do some works in that folder.

## Files

```bash
bash import_files.sh -o ~/MyBlog
```

OR

```bash
chmod +x import_files.sh
sudo cp import_files.sh /usr/local/bin/.
import_files.sh -o ~/MyBlog
```

--> Creates `common_files` replicating exactly the structure of the content file on your blogs.

## Scheme

```nash
bash import_scheme.sh -o ~/MyBlog
```

OR

```bash
chmod +x import_scheme.sh
sudo cp import_scheme.sh /usr/local/bin/.
import_scheme.sh -o ~/MyBlog
```

--> Creates `scheme.sh` containing all the `stx` command to replicated the structure of your blog.

Example

```
stx subject add AI-Generated Experiment
stx subject add Default
stx subject add Functional Programming
stx subject add LaTeX
stx subject add Linux
stx subject add Recreational Programming
stx subject add Software & Computational Architecture
stx subject add System Design
```

## Reference

For more see:

[https://github.com/julienlargetpiet/Statix](https://github.com/julienlargetpiet/Statix)




