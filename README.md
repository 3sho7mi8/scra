# Scraping Sample

## Installing
Mac:
```
brew install chromedriver
```

## Usage

```
start_scraping 'https://www.google.com/' do
  # ここにスクレイピングのコードを書く
  p title #=> "Google"
  save_and_open_screenshot
end
```
