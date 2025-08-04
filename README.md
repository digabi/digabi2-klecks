# digabi2-klecks

Dockerized Klecks for Digabi 2

## Development

```bash
# Pull in Klecks
just submodule-init

# Update Klecks to latest
just submodule-update

# Build image locally
just build

# Create development release
just dev-release <major/minor/patch/<semver>>

# Promote release to production
just prod-release
```
