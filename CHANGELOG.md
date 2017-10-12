# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.4.0] - 2017-10-11
### Added
- Custom projects paths options so that users not comfortable with messing around with core options can set where to find projects

### Changed
- Refactored how to obtain the complete path list to cycle through and made the code for it more readable.

### Fixed
- Sibling projects should be always fetched, core Project Home is the one toggleable.

## [1.3.5] - 2017-01-21
### Changed
- Removed console.log left in code

## [1.3.4] - 2017-07-21
### Added
- Added CHANGELOG

### Changed
- Parent folder is only added to pathname if there's more than one place to look for project
- Changed README GitHub hosted project GIF to a Imgur hosted project GIF
