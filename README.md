# digabi2-klecks

Dockerized klecks

## Development

Run the following commands to initialize the development environment.

```
git submodule init
git submodule update
```

The development flow is roughly as follows

1. Make your changes
2. To test your changes, build and tag the docker image by running `./docker-build.sh <version>`.
3. Update digabi2 `apps-dev.json` to use the new image version.

## Development release

To release a new development version of app, run `./dev-release.sh <major|minor|patch|<semver>>`. This will create a new git tag, and build and push a Docker image with that tag into our private ECR. Building and pushing to ECR happens in Github Actions. Once built and pushed, you can update the app version `apps-dev.json` in the `digabi2` repository to point to the new tag.

## Release

To promote a development version of the image to production (i.e. release it to our public ECR) run `./release.sh`. Choose the tag you want to promote to production, which will trigger a Github Actions workflow. The workflow will push the corresponding private image to our public ECR. After this has completed, update the app version in `apps-prod.json` in the `digabi2` repository to point to the newly released image tag.
