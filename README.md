# ci-bootstrap

Re-useable, version controlled, collection of scripts to setup a CI server quickly and easily. 

Each of the scripts in this repo can be executed by: 

```bash
curl https://raw.githubusercontent.com/levibostian/ci-bootstrap/path/to/file.sh | bash 

# If you need to pass in args to the command:
curl https://raw.githubusercontent.com/levibostian/ci-bootstrap/path/to/file.sh | bash -s arg

# If you want to pass in environment variable values:
curl https://raw.githubusercontent.com/levibostian/ci-bootstrap/path/to/file.sh | ENV_VAR=value bash 
```

*Note: It's up to you to use a version-controlled commit hash for the path to the script, or, use a branch such as `master` that is always up-to-date.*

*Note: Scripts inside of the `deprecated` folder are not being updated and may be deleted at some point. They exist here for reference and legacy code, only.*

*Note: This project may be unmaintained at some point in the future to switch over to using [shared config files](https://docs.travis-ci.com/user/build-config-imports/). The scripts may be archived for read-only purposes.*

# Assumptions

Scripts in this repo are assumed to be executed in a certain environment. However, they may work in others. 

* Ubuntu or macOS running on Travis-CI

# Design of the scripts

Here are some of the design decisions made while creating this repo. 

### Environment variables

CI servers commonly use environment variables to set secret and non-secret values. To follow this pattern, use these scripts by setting environment variables the scripts require on the CI machine. 

To follow this, scripts that share things in common (example: All DigitalOcean spaces scripts) try to have as many environment variables as possible in common so you have to set values once and be able to use many of the scripts in this repo. 