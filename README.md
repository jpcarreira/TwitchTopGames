# TwitchTopGames
An iOS app showing Twitch top 5 games and respective most popular streams. This working prototype includes the following "features":
* an initial screen showing the 5 most viewed games in Twitch
* by clicking any of the gamebox thumbnails it's shown a new screen with the 10 most viewed channels for the selected game
* by choosing a particular channel you'll be presented with the channel's home page, at Twitch

## Requirements
This project was developed in **XCode 8.2.1** using **Swift 3.0.2**.
This app has dependencies managed by [carthage](https://github.com/Carthage/Carthage) so you should run the following command after cloning the project:
```carthage update --platform iOS```

## Improvements
* add a settings screen where the user can customize how many games and streams he wants to be displayed (the app already supports that)
* add a pull-to-refresh functionality in both games and streams screen
* implement a memory- or disk-caching system to support offline mode and/or to prevent fetching new data from the Twitch API whenever a screen appears
* add proper placeholders to cover no internet service or a downtime in the service
* improve TTGTwitchClient with proper error handling (instead of just sending a "success == false" and nil json whenever the request fails)
* implement proper UI feedback in error situations

## Steps taken during implementation - Logged time (in hours)
* analysis of requirements - 0.5h
* project setup (setting up XCode, carthage, importing JCNetworkWrapper) - 1h
* implementing TTGTwitchClient, modeling the server response - 3h
* implementing TTGGamesViewController and respective view, decorating the view with model data - 2h
* implementing TTGStreamCollectionViewController and respective view, decorating the view with model data - 1h
* implementing TTGStreamWebViewController - 0.5h
* general refactoring tasks - 3h
