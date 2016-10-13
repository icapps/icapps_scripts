# Build in docker and deploy to Heroku

You can use the following script to build the web project using docker and to deploy it to Heroku.

## Installation

Clone this repository to your drive.

    git clone git@github.com:icapps/scripts.git scripts


**Done!**

## Run

Run one of the following commands from the repository root:

    $ ./scripts/docker.sh develop
    $ ./scripts/docker.sh staging
    $ ./scripts/docker.sh production

## What will happen?

This is what is going to happen:

- A remote will be added in git if needed.
- We build the project using a Docker image provided in the project source code.
- The built image will be pushed to Heroku where it will be deployed.
- When the build version is updated we tag the current commit and push this change to the origin.

## Contributors

[Jelle Vandebeeck](https://github.com/fousa)
[Maarten Anckaert](https://github.com/MaartenAnckaert)

## License

The MIT License (MIT)

Copyright (c) 2016 iCapps

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
