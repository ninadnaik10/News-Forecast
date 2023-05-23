# Hello Contributors!

- If you want to have a feature in the project open an [issue](https://github.com/ninadnaik10/expense-splitter/issues) in the repository.
- Found an issue and want to fix it? Thanks a lot, go ahead.
- Fork the project and `git clone https://github.com/<YourUserName>/news-forecast.git`
- Create another branch `git checkout -b <branch-name>`
- Add an upstream `git remote add upstream https://github.com/ninadnaik10/news-forecast.git`
- Run `flutter pub get & flutter pub run build_runner build`
- Make required changes
- Make a [pull request](https://opensource.com/article/19/7/create-pull-request-github)

## API keys
- Get your API keys from [Weather API](https://www.weatherapi.com/) and [News API](https://newsapi.org/)
- Create a file named `key.dart` in `lib/constants/` folder.
- Add your keys in this format
`const API_KEY = '<Your NewsAPI key>';
const WEATHER_API_KEY = '<Your WeatherAPI key>';`

## Things to remember

- Try to avoid adding new dependencies to save an hour.
- Format your code by running `flutter format`
- Write short and concise commit message and titles.
