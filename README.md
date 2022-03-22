# Slides for MDENet Epsilon Playground training

These are the slides for the second Epsilon training event in the [MDE-Net EPSRC expert network](https://www.mde-network.org/).

The latest build of the slides can be browsed online from [here](https://agarciadom.github.io/epsilon-integration-mdenet-training/).

## Prerequisites

In order to compile the slides, you will need to install [Docker](https://docs.docker.com/get-docker/).

If you want to have the slides automatically recompile when the `slides.md` or `slides.css` files change, you will also need to install `inotify-tools` (Linux-specific):

```shell
sudo apt-get install inotify-tools
```

## Compilation

To compile the slides continuously using Docker, use:

```shell
./compile.sh
```

To compile the slides continuously using a local installation of [Pandoc](https://pandoc.org/), use:

```shell
./compile.sh -s
```

To compile the slides once using Docker, use:

```shell
./compile.sh -o
```

To compile the slides once using a local installation of Pandoc, use:

```shell
./compile.sh -os
```
