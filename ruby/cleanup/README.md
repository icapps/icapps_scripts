# Cleanup Xcode folders

You can use the following script to cleanup some Xcode project generated files.

## Installation

Clone this repository to your drive.

    git clone git@github.com:icapps/scripts.git scripts


**Done!**

## Archives

Cleanup you archives with the following command from the project root:

    $ ./scripts/cleanup_archives.rb

Sometimes there are archives (for apps you upload to the App Store) that you don't wish to remove. You can add the identifiers of these apps to the `identifiers_to_keep` array on top of the script.

When running the script you'll get an overview of the archive's identifiers that will be deleted.

## Contributors

[Jelle Vandebeeck](https://github.com/fousa)

## License

The MIT License (MIT)

Copyright (c) 2015 iCapps

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

