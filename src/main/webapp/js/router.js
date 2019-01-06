app = angular.module('app', ['ui.router', 'ngCookies', 'angularFileUpload']);
app.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("index/1");
    $stateProvider
        .state('index', {
            url: "/index/{categoryId}",
            views: {
                'content': {
                    templateUrl: "newsOfIndex.html"
                },
                'nav': {
                    templateUrl: "newsOfNav.html"
                }
            }

        })
        .state('detail', {
            url: "/detail/{newsId}",
            views: {
                'content': {
                    templateUrl: "detail.html"
                },
                'nav': {
                    templateUrl: "newsOfNav.html"
                }
            }

        })
        .state('addNews', {
            url: "/user/addNews",
            views: {
                'content': {
                    templateUrl: "addNews.html"
                }
            }
        })
        .state('myNews', {
            url: "/user/myNews",
            views: {
                'content': {
                    templateUrl: "myNews.html"
                }
            }
        })
        .state('info', {
            url: "/user/info",
            views: {
                'content': {
                    templateUrl: "userInfo.html"
                }
            }
        })
        .state('collect', {
            url: "/user/collect",
            views: {
                'content': {
                    templateUrl: "collect.html"
                }
            }
        })
        .state('subscribe', {
            url: "/user/subscribe",
            views: {
                'content': {
                    templateUrl: "subscribe.html"
                }
            }
        })

        .state('search', {
            url: "/search/{param}",
            views: {
                'content': {
                    templateUrl: "search.html"
                }
            }
        })
        .state('author', {
            url: "/author/message/{authorId}",
            views: {
                'content': {
                    templateUrl: "author.html"
                }
            }
        });
});
