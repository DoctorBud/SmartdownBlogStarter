---
title:  "Smartdown Blog Kit"
date:  "2020-03-13"
description:  "Examples, tools and templates to publish Smartdown-enabled blogs"
categories:
layout: default
type: home
---

# smartdown/blog-kit

## Examples, tools and templates to publish Smartdown-enabled blogs

This `README.md` document is intended for authors who wish to deploy their static website or blog using the templates in this repository. This document will not be visible to visitors of the deployed blog.

An important goal of this project is to separate an author's original *content* from the boilerplate mechanics of *presentation* and *deployment*. This is still an imperfect separation, but for the most part, an author's content will reside in the `_pages` and `_posts` directories at the root of this project. The mechanics of publishing this content to a particular *site* with a particular *theme* has been abstracted into the idea of a *target*. A target is a subdirectory of the content repo that has theme-specific and site-specific configuration information.

### QuickStart

This will enable you to quickly set up a copy of the `blog-kit` example on a forked version of the GitHub repo.

#### Fork or Copy the Repository

- Fork the `blog-kit` GitHub repository using [Fork](https://github.com/smartdown/blog-kit#fork-destination-box).
- If desired, rename your forked repository and edit its description from the default to a description of your choice. The name of the forked repository will be used as the default website name when deployed. For the purpose of this QuickStart, we'll assume you've left the name as `blog-kit`.

#### Choose a target

- The `blog-kit` supports the idea of deploying a set of shared content to a variety of possible *targets*. For this QuickStart, you will need to choose a target deployment from the current list:
	- cb: Based on [Start Bootstrap's Clean Blog - Jekyll](https://startbootstrap.com/themes/clean-blog-jekyll/) blog theme.
	- sp: Based on [Start Bootstrap's Stylish Portfolio](https://startbootstrap.com/previews/stylish-portfolio/)
	- mm: Based on [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) blog theme.
- Let's assume you choose the 'mm' target for the remainder of this QuickStart.

#### Install dependencies

Many of the targets assume a Jekyll-based deployment and rely on various Ruby Gems to enable local development and static site building. So you will need to perform a one-time installation of the necessary dependencies.

- Verify you have Ruby installed. *there is probably documentation about this on the Jekyll site*.
- Go to the `mm` targets directory: `cd targets/mm/`
- Install dependencies: `bundle install`

#### Serve the site locally

Assuming your current directory is your local root (`blog-kit/`, for this QuickStart), then you can *serve* the `mm` site locally with the command `targets/serve.sh mm`.

#### Publish the site to your repo's GitHub Pages

Assuming your current directory is your local root (`blog-kit/`, for this QuickStart), then you can *publish* the `mm` site locally with the command `targets/publish.sh mm`.


### Adding Content: Pages vs Posts




### Customizing the Look and Style of your new site



#### Basics of Markdown




#### Basics of Smartdown



### Details, Details, Details

#### `targets/` scripts

The `targets/` subdirectory of this project contains several scripts to manage the different targets.

- `targets/serve.sh <target-name>`
- `targets/publish.sh <target-name>`
- `targets/clean.sh <target-name>`
- `targets/build.sh <target-name>`
- `targets/sync.sh <target-name>`

Typically, only `serve.sh` and `publish.sh` will be used.


### Default GitHub Pages Domain Name Setup

Talk about the default, where the user doesn't use `CNAME`


#### Custom GitHub Pages Domain Name Setup

Talk about using `CNAME` and how this will inhibit `https` unless you augment it with a service like `CloudFlare`

#### Setting up CloudFlare to enable `https`

blah blah blah




#### License and Credits

Mostly links to the software used


