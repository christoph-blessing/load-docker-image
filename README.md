# load-docker-image

This composite action loads a Docker image from a downloaded artifact.

## Example

```yaml
name: ci

on:
  push:
    branches:
      - "main"

jobs:
  build_image:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      - name: Build and export
        uses: docker/build-push-action@v4
        with:
          tags: myimage:latest
          outputs: type=docker,dest=/tmp/myimage.tar
      - name: Upload image as artifact
        uses: actions/upload-artifact@v3
        with:
          name: myimage
          path: /tmp/myimage.tar
  use:
    needs: build_image
    runs-on: ubuntu-latest
    steps:
      - name: Load image     
        uses: cblessing24/load-docker-image@v2
        with:
          name: myimage
      - name: List images
        run: docker image ls -a
```
