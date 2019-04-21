# Breast Cancer Detection App ![language](https://img.shields.io/badge/language-ruby-blue.svg)

> Application to help detect breast cancer from mammogram

![Screenshot of the app](https://user-images.githubusercontent.com/30215564/56472220-10045900-645c-11e9-8c5f-4f4f416cf430.png)

## :books: Table of Contents

- [Installation](#package-installation)
- [Usage](#rocket-usage)
- [Support](#hammer_and_wrench-support)
- [Contributing](#memo-contributing)
- [License](#scroll-license)

## :package: Installation

Before starting, make sure Ruby is installed on your system. Fire command prompt and run command:

```bash
ruby -v
```

Make sure Rails is installed:

```bash
rails -v
```

If you see Ruby and Rails version then you are good to continue, other wise [setup Ruby on Rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)

Make sure you also have NPM:

```bash
npm -v
```

If you see NPM version then you are good to continue, other wise [setup NPM and Node.js](https://nodejs.org/en/)

Once done, you can install the application

1. Clone the repo

```bash
git clone https://github.com/leonard-henriquez/BreastCancer.git
```

2. Install all Ruby dependencies

```bash
bundle install
```

3. Install all Javascript dependencies

```bash
npm install
```

4. Create db and migrate schema

```bash
rake db:drop db:create db:migrate
```

5. Create your environnment

```bash
cp .env.example .env
```

Then, you should edit the file .env to reflect your configuration

## :rocket: Usage

Run the application

```bash
rails s
```

The application will be available at the following url: http://localhost:3000/

## :hammer_and_wrench: Support

Please [open an issue](https://github.com/leonard-henriquez/BreastCancer/issues/new) for support.

## :memo: Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/leonard-henriquez/BreastCancer/compare/).

## :scroll: License

[MIT](LICENSE) © [Leonard Henriquez](https://github.com/leonard-henriquez)
