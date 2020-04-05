# ci-bootstrap

Re-useable, version controlled, collection of scripts to setup a CI server quickly and easily. 

Each of the scripts in this repo can be executed by: 

```bash
curl -o- https://raw.githubusercontent.com/levibostian/ci-bootstrap/path/to/file.sh | bash 
```

*Note: It's up to you to use a version-controlled commit hash for the path to the script, or, use a branch such as `master` that is always up-to-date.*

*Note: Scripts inside of the `deprecated` folder are not being updated and may be deleted at some point. They exist here for reference and legacy code, only.*

# Design of the scripts

Here are some of the design decisions made while creating this repo. 

### Environment variables

CI servers commonly use environment variables to set secret and non-secret values. To follow this pattern, use these scripts by setting environment variables the scripts require on the CI machine. 

To follow this, scripts that share things in common (example: All DigitalOcean spaces scripts) try to have as many environment variables as possible in common so you have to set values once and be able to use many of the scripts in this repo. 