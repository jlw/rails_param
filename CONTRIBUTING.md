# Contributing

If you discover issues, have ideas for improvements or new features, please
report them to the [issue tracker][1] or submit a pull request. Please try to
follow these guidelines when you do so.

## Issue reporting

- Check that the issue has not already been reported.
- Check that the issue has not already been fixed in the latest code (a.k.a. `master`).
- Be clear, concise and precise in your description of the problem.
- Open an issue with a descriptive title and a summary in grammatically correct, complete sentences.
- Include any relevant code to the issue summary.

## Pull requests

- Read [how to properly contribute to open source projects on GitHub][2].
- Fork the project.
  - Install dependencies and ensure tests pass before you start `./bin/setup`
- Use a topic/feature branch to easily amend a pull request later, if necessary.
- Write [good commit messages][3].
- Use the same coding conventions as the rest of the project.
- Commit and push until you are happy with your contribution.
- If your change has a corresponding open GitHub issue, prefix the commit message with `[Fix #github-issue-number]`.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Add an entry to the [Change Log](CHANGELOG.md) accordingly.
- Make sure the test suite is passing for all supported Ruby versions: `./bin/run install && ./bin/run rspec`.
- Make sure the code you wrote doesn't produce RuboCop offenses `bundle exec rubocop`.
- [Squash related commits together][5].
- Open a [pull request][4] that relates to _only_ one subject with a clear title and description in grammatically correct, complete sentences.

## Supported versions

This project intends to actively support all current _minor_ versions of both
Ruby and Rails. We use the `appraisal` gem to run tests agains all current minor
versions of Rails (maintained in `~/Appraisals`) in conjunction with a simple
`./bin/run` script that defines and loops through the current minor versions
of Ruby. We remove versions of Ruby and Rails from this testing setup after they
reach their official end of life.

[1]: https://github.com/jlw/rails_simple_params/issues
[2]: http://gun.io/blog/how-to-github-fork-branch-and-pull-request
[3]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[4]: https://help.github.com/articles/about-pull-requests
[5]: http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html
