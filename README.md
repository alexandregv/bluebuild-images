# BlueBuild Images &nbsp; [![bluebuild build badge](https://github.com/alexandregv/bluebuild-images/actions/workflows/build.yml/badge.svg)](https://github.com/alexandregv/bluebuild-images/actions/workflows/build.yml)

This repository provides Linux images built using [BlueBuild](https://blue-build.org). It is based on the [BlueBuild template](https://github.com/blue-build/template).  
The CI builds weekly and follows base image updates, adding the modified layers on top.

Images are built according to YAML recipes found in [`./recipes/`](./recipes/). They share common modules found in [`./recipes/modules/`](./recipes/modules/).

## Images

#### Fedora Silverblue GNOME
- Recipe: [`./recipes/silverblue-gnome.yaml`](./recipes/silverblue-gnome.yaml)
- Image: [`ghcr.io/alexandregv/fedora-silverblue-gnome`](https://ghcr.io/alexandregv/fedora-silverblue-gnome)

Fedora Silverblue (atomic) with the Cosmic desktop environment and common setup.

#### Fedora Silverblue GNOME Nix
- Recipe: [`./recipes/silverblue-gnome-nix.yaml`](./recipes/silverblue-gnome-nix.yaml)
- Image: [`ghcr.io/alexandregv/fedora-silverblue-gnome-nix`](https://ghcr.io/alexandregv/fedora-silverblue-gnome-nix)

#### Fedora Silverblue Cosmic
- Recipe: [`./recipes/silverblue-cosmic.yaml`](./recipes/silverblue-cosmic.yaml)
- Image: [`ghcr.io/alexandregv/fedora-silverblue-cosmic`](https://ghcr.io/alexandregv/fedora-silverblue-cosmic)

Fedora Silverblue (atomic) with the Cosmic desktop environment and common setup.

#### Fedora Silverblue Cosmic Nix
- Recipe: [`./recipes/silverblue-cosmic-nix.yaml`](./recipes/silverblue-cosmic-nix.yaml)
- Image: [`ghcr.io/alexandregv/fedora-silverblue-cosmic-nix`](https://ghcr.io/alexandregv/fedora-silverblue-cosmic-nix)

Fedora Silverblue (atomic) with the Cosmic desktop environment, Nix package manager and common setup.

## Installation

To rebase an existing atomic Fedora installation to the latest build:

- (First time only) First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/alexandregv/fedora-silverblue-cosmic:43
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/alexandregv/fedora-silverblue-cosmic:43
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/alexandregv/bluebuild-images
```
