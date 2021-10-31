# sp_test_ruby

Practice

# Example output

`$ ruby parser.rb webserver.log`

```
> list of webpages with most page views ordered from most pages views to less page views
  /about/2             90   visits
  /contact             89   visits
  /index               82   visits
  /about               81   visits
  /help_page/1         80   visits
  /home                78   visits

> list of webpages with most unique page views also ordered
  /about/2             22   unique views
  /contact             23   unique views
  /index               23   unique views
  /about               21   unique views
  /help_page/1         23   unique views
  /home                23   unique views
```

# TODOs

- File not exists
- Allow to read file from current location
- Explain why chose Array over Has
- sort_by then reverse - https://stackoverflow.com/a/2651028
- `printf "%-20s %-4s visits\n"` is not robust solution (but don't want to spend time on it)

# Explanations

- I've chose `File.each_line` to reduce memory usage
