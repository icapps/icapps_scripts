# Generate Apteligent OAuth token

You can use the following script to generate your Apteligent application OAuth token. This is required when you want to upload the dSYM to the Apteligent service.

## Installation

Clone this repository to your drive.

    git clone git@github.com:icapps/scripts.git scripts


**Done!**

## OAuth

Run the following script:

    $ ./scripts/generate_apteligent_token.rb

The script requires you to give some input. Here is an overview of the required input and where you can find this data:

- *username*: Your Apteligent username (most of the time this is your email).
- *client id*: Your Apteligent OAuth client id can be found on your [user settings](https://app.crittercism.com/developers/user-settings) page under the _OAuth Tokens_ tab.
- *password*: Your Apteligent account password.
- *application id*: The id of the application for which you want to generate the OAuth token. This id can be found in the _app settings_ in the _Basics_ tab.

When pressed enter your Apteligent password will be required once more. When everything is entered correctly you will receive the OAuth token that you can use

## Contributors

[Jelle Vandebeeck](https://github.com/fousa)

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
