# ORM AutoPilot

LLM-backed tool to optimize your ORM code!

## Team Member

|     Name                |     UNI     |
| ----------------------- | ----------- |
| Anika Agustin Malhotra  |  aam2314    |
| Haonan Wang             |  hw2983     |
| Xinjin Li               |  xl3350     |
| Zhijing Hu              |  zh2579     |


## Setup Instructions

### Checkout The Correct Version And Environment Setup

First, ensure that you are at the correct version of the repo. We will
have **three(3)** tags:

- `iter1`
- `iter2`
- `final`

Please run
```bash
$ git checkout <tag_name>
```
to checkout the correct version.

This project uses Ruby 3.2.2. Please have the proper version of ruby installed. You may refer to the instructions from `rbenv` or `rvm` to install Ruby 3.2.2.

### Run The Server

Once Ruby is installed, run the following command to install all dependencies:

```bash
$ bundle install
```

Finally, under the project folder, run

```bash
$ rails server
```

The application is up and listening at http://127.0.0.1:3000

### Run The Tests

To run unit tests:

```bash
$ bundle exec rspec
```

To run user stories:

```bash
$ bundle exec cucumber
```

You will find test coverage reports under `coverage/`. Currently, the test coverage is 100% for iteration 2. (We excluded `channels`, `jobs`, and `mailers` in the coverage counting since we did not involve them in our app. )

## Heroku Deployment Link:

https://cryptic-shore-36909-e715a94c8071.herokuapp.com/

## Repo Link

https://github.com/endless-hu/orm-autopilot

## Development Instructions

- [Iteration 1](./docs/iter1.md)
- [Iteration 2](./docs/iter2.md)
- [Final](./docs/final.md)
