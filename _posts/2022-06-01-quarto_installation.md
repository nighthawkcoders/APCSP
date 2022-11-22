# Install nbdev

[Documentation](https://nbdev.fast.ai/tutorials/tutorial.html)

For the most part the documentation is pretty straight forward. Here are some extra details that might be helpful:
* When you initialize the repository, remember to use mkdir and do the commands in that directory.
* You will be asked to generate a token for a password, you will need to make sure to give yourself repository permissions on the token otherwise the password will give you a 403 error when you run git push. 

'''Delete below as needed''' 

# Install Quarto

[Source](https://docs.posit.co/resources/install-quarto/#quarto-tar-file-install)

```bash
$ export QUARTO_VERSION="1.2.262"
```
You can change the version to the latest version which can be found [here](https://github.com/quarto-dev/quarto-cli/releases/)

Run these commands to install Quarto in WSL 
```bash
$ sudo mkdir -p /opt/quarto/${QUARTO_VERSION}

$ sudo curl -o quarto.tar.gz -L \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"

$ sudo tar -zxvf quarto.tar.gz \
    -C "/opt/quarto/${QUARTO_VERSION}" \
    --strip-components=1

$ sudo rm quarto.tar.gz

$ sudo ln -s /opt/quarto/${QUARTO_VERSION}/bin/quarto /usr/local/bin/quarto
```

# Create a New Repository

Create a new directory then run:

```bash
$ quarto create-project --type website:blog .
```

Migrate posts and notebooks with these commands:
*It is a good idea to delete all the markdown posts that were created by make server (the files you put into .gitignore)

```bash
$ cp -r ../blog/_notebooks/* posts
$ cp -r ../blog/_posts/* posts
```
For me the .. is home/username and blog is replaced with the directory that the repository is called.

Do the same with images

```bash
$ cp ../blog/images/* posts
$ cp -r ../blog/images/copied_from_nb/* posts/
```

Install nbdev to migrate 

```bash
$ conda install -c fastai nbdev

$ nbdev_migrate --path posts
```

If you didn't delete the markdown posts I specified earlier you will run into an exception error. You will need to manually remove these files in the posts directory. 

[Creating the Blog](https://nbdev.fast.ai/tutorials/blogging.html#creating-a-blog-within-a-nbdev-project)

Publish 