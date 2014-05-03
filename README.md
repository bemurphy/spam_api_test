Spam API Test
=============

This is not a real app.  It's just a little test for writing a naive endpoint
using [Cuba](http://cuba.is/) as a spam checker.

The app is deliberately simple for now.  It accepts regular form encoding, but
should reply with JSON.  It should have a single endpoint `/check` that requires
an `ip` and `content` be POST'd to it.  If a message is considered spam, the
response should be the JSON for `{is_spam: true}`.

Your task is simple: make all the tests in `test/suite.rb` pass.

Procedure
---------

```
$ bundle
$ bundle exec rake test
```

You'll get errors.  Write some code, make a test pass.  Once you get nothing
but lots of `.` as output, you have won!
