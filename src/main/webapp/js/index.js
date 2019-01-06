app.controller('indexCtrl', function ($scope, $http, $stateParams) {
    var categoryId = $stateParams.categoryId;
    $scope.indexNews = [];
    $scope.realtimeNews = [];
    $http({
        method: 'get',
        url: 'news/index/' + categoryId
    }).success(function (m) {
        $scope.indexNews = m.data;
    });

    // 实时新闻
    $http({
        method: 'get',
        url: '/news/realtime'
    }).success(function (m) {
        $scope.realtimeNews = m.data;
    });

});

app.controller('navCtrl', function ($scope, $http) {
    $scope.categories = [];
    $http({
        method: 'get',
        url: 'news/getAllCategories'
    }).success(function (m) {
        $scope.categories = m;
    });
});

/**
 * 新闻详情
 */
app.controller('detailCtrl', function ($scope, $http, $stateParams, $window, currentUser) {
    $scope.newsDetail = [];
    $scope.comments = [];

    $scope.addComment = function (comment) {
        $scope.comments.push(comment);
    };

    $scope.commentdisplay = false;
    $scope.commentView = function () {
        $scope.commentdisplay = !$scope.commentdisplay;
    };

    $http({
        method: 'get',
        url: 'news/detail/' + $stateParams.newsId
    }).success(function (m) {
        $scope.newsDetail = m.data;
        $scope.comments = $scope.newsDetail.comments;
    });

    // 评论
    $scope.userComment = "";
    $scope.commentSubmit = function (newsId) {
        var userString = $window.sessionStorage.getItem("user");
        if (userString == null || userString === "") {
            alert("请登录");
        } else {
            var currentuser = JSON.parse(userString);
            var token = currentuser.token;
            currentUser.get(token).then(function (m) {
                var comment;
                if (m.data.state !== 1) {
                    $window.sessionStorage.setItem("user", "");
                    alert("请登录");
                    window.location.href = "#/index";
                } else {
                    comment = {"content": $scope.userComment, "newsId": newsId};
                    $http({
                        method: 'post',
                        url: '/news/addComment',
                        data: comment
                    }).success(function (m) {
                        $scope.comments = m.data;
                        window.location.href = '#/detail/' + newsId;
                    });
                }
            });
        }
    };

    $scope.addcollection = function (newsId) {
        var userString = $window.sessionStorage.getItem("user");
        if (userString == null || userString === "") {
            alert("请登录");
        } else {
            var currentuser = JSON.parse(userString);
            var token = currentuser.token;
            currentUser.get(token).then(function (m) {
                if (m.data.state !== 1) {
                    $window.sessionStorage.setItem("user", "");
                    alert("请登录");
                } else {
                    $http({
                        method: 'post',
                        url: 'news/collect/' + newsId
                    }).success(function (m) {
                        alert(m.stateInfo);
                    });
                }
            });
        }
    };
});


app.controller("addnewsCtrl", function ($scope, $http, $window, currentUser) {
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        alert("请登录");
        window.location.href = "#/index";
    } else {
        var currentuser = JSON.parse(userString);
        var token = currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state !== 1) {
                $window.sessionStorage.setItem("user", "");
                alert("请登录");
                window.location.href = "#/index";
            }
        });
    }
    $scope.content = "";
    $scope.title = "";
    $scope.tag = "";
    $scope.categroy = "";
    $scope.category2 = "";
    $scope.summary = "";
    $scope.categories = [];
    $http({
        method: 'get',
        url: 'news/getAllCategories'
    }).success(function (m) {
        $scope.categories = m;
        $scope.categroy = $scope.categories[0];
    });

    $scope.submit = function () {
        $scope.content = UM.getEditor('myEditor').getContent();
        var text = UM.getEditor('myEditor').getContentTxt();
        $scope.summary = text.replace(/ +/g, "").substring(0, 78);
        var category = {
            "categoryId": $scope.category2.categoryId,
            "newsCategoryName": $scope.category2.newsCategoryName
        };
        var news = {
            'title': $scope.title,
            'content': $scope.content,
            'category': category,
            'summary': $scope.summary
        };
        var data = {'news': news, 'tag': $scope.tag};
        var string = JSON.stringify(data);
        $http({
            method: 'post',
            url: 'news/add',
            data: string
        }).success(function (m) {
            alert("发表成功");
            window.location.href = "#/user/newsshow"
        });
    }
});


app.filter('to_html', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
});

//登陆服务
app.factory('loginService', ['$http', function ($http) {
    var doRequest = function (userLoginName, userPassword) {
        return $http({
            method: 'POST',
            url: 'user/login',
            async: false,
            data: '{"username":"' + userLoginName + '","password":"' + userPassword + '"}',
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        });
    };
    return {
        userLogin: function (userLoginName, userPassword) {
            return doRequest(userLoginName, userPassword);
        }
    }
}]);

app.controller('login', function ($scope, $http, loginService, $window, currentUser) {

    $scope.searchparam = "";
    $scope.tosearch = function () {
        if ($scope.searchparam !== "") {
            window.location.href = '#/search/' + $scope.searchparam;
        }
    };
    $scope.currentuser = [];
    $scope.logined = false;
    $scope.loginresule = true;
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        $scope.logined = false;
    } else {
        $scope.currentuser = JSON.parse(userString);
        var token = $scope.currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state === 1) {
                $scope.logined = true;
            } else {
                $scope.logined = false;
                $window.sessionStorage.setItem("user", "");
            }
        }, function (m) {
            console.log("error");
        });
    }
    /**
     * 登录
     * @param user 用户
     */
    $scope.userLogin = function (user) {
        var userLoginName = user.userLoginName;
        var userPassword = user.userPassword;
        loginService.userLogin(userLoginName, userPassword).then(function (message) {
            var state = message.data.state;
            var data = message.data.data;
            if (state === 1) {
                var user = {"token": data.token, "userId": data.user.userId, "nickname": data.user.nickname};
                $scope.currentuser = user;
                var userString = JSON.stringify(user);
                $window.sessionStorage.setItem("user", userString);
                $scope.loginresule = true;
                $('#modal-login').modal('hide');
                $scope.logined = true;
            } else {
                //登陆失败
                $scope.loginresule = false;
            }
        });
    };

    $scope.logout = function () {
        $window.sessionStorage.setItem("user", "");
        $http({
            method: 'post',
            url: 'user/logout'
        }).success(function (m) {
            if (m.state === 1) {
                $scope.currentuser = [];
                $scope.logined = false;
                window.location.href = "#/index"
            }
        });
    };
});

app.controller('search', function ($scope, $http, $stateParams) {
    $scope.searchnews = [];
    $http({
        method: 'get',
        url: 'news/search/' + $stateParams.param
    }).success(function (m) {
        console.log(m.data);
        $scope.searchnews = m.data;
    });

});

/**
 * 收藏列表
 */
app.controller('collect', function ($scope, $http, $window, currentUser) {
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        alert("请登录");
        window.location.href = "#/index";
    } else {
        var currentuser = JSON.parse(userString);
        var token = currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state !== 1) {
                $window.sessionStorage.setItem("user", "");
                alert("请登录");
                window.location.href = "#/index";
            }
        });
    }
    $scope.collectionNews = [];

    $http({
        method: 'post',
        url: 'news/collection'
    }).success(function (m) {
        $scope.collectionNews = m.data;
    });

    $scope.cancelCollection = function (newsId) {
        $http({
            method: 'post',
            url: 'news/cancelCollection/' + newsId
        }).success(function (m) {
            if (m.state === 1) {
                $http({
                    method: 'post',
                    url: 'news/collection'
                }).success(function (m) {
                    $scope.collectionNews = m.data;
                });
            }
        });
    };
});

app.controller('subscription', function ($scope, $http, $window, currentUser) {
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        alert("请登录");
        window.location.href = "#/index";
    } else {
        var currentuser = JSON.parse(userString);
        var token = currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state !== 1) {
                $window.sessionStorage.setItem("user", "");
                alert("请登录");
                window.location.href = "#/index";
            }
        });
    }
    $scope.authors = [];
    $http({
        method: 'post',
        url: '/user/getSubscription'
    }).success(function (m) {
        $scope.authors = m.data;
    });

    $scope.cancelSubscription = function (authorId) {
        $http({
            method: 'post',
            url: '/user/delSubscription/' + authorId
        }).success(function (m) {
            if (m.state === 1) {
                $http({
                    method: 'post',
                    url: '/user/getSubscription'
                }).success(function (m) {
                    $scope.authors = m.data;
                });
            }
        });
    }
});

/**
 * 查看个人信息
 */
app.controller('usermessage', function ($scope, $http, FileUploader, $window, currentUser) {
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        alert("请登录");
        window.location.href = "#/index";
    } else {
        var currentuser = JSON.parse(userString);
        var token = currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state !== 1) {
                $window.sessionStorage.setItem("user", "");
                alert("请登录");
                window.location.href = "#/index";
            }
        });
    }
    $scope.user = [];
    $scope.checkpwd = "";
    $scope.password = "";
    $scope.content = "";
    $scope.imagePath = "";

    $scope.uploader = new FileUploader({
        url: 'user/uploadUserFile'
    });
    $scope.uploader.onAfterAddingFile = function (fileItem) {
        var length = $scope.uploader.queue.length;
        if (length > 1) {
            $scope.uploader.queue.splice(0, 1);
        }
    };
    $scope.uploader.onSuccessItem = function (item, res, status, headers) {
        $scope.imagePath = res.stateInfo;
        $http({
            method: 'post',
            url: '/user/updateImage',
            data: $scope.imagePath
        }).success(function (m) {
            if (m.state === 1) {
                alert("修改成功");
                $scope.user.imagePath = $scope.imagePath;
                $('#modal-img').modal('hide');
            } else {
                console.log("error");
            }
        });
    };

    $scope.submitPic = function () {
        $scope.uploader.uploadAll();
    };

    $scope.updateIntroduction = function (content) {
        $http({
            method: 'post',
            url: '/user/updateIntroduction',
            data: '{"content":"' + content + '"}'
        }).success(function (m) {
            $scope.user.briefIntroduction = content;
            $('#modal-introduction').modal('hide');
        });
    };

    $scope.checkPassword = function () {
        return $scope.password !== $scope.checkpwd;
    };

    $scope.updatepassword = function (password) {
        $http({
            method: 'post',
            url: 'updatePassword',
            data: password
        }).success(function (m) {
            console.log(m);
            alert("修改成功");
            $('#modal-password').modal('hide');
        });
    };

    $http({
        method: 'post',
        url: '/user/info'
    }).success(function (m) {
        $scope.user = m.data;
    });
});

app.controller('newsShow', function ($scope, $http, $window, currentUser) {
    var userString = $window.sessionStorage.getItem("user");
    if (userString == null || userString === "") {
        alert("请登录");
        window.location.href = "#/index";
    } else {
        var currentuser = JSON.parse(userString);
        var token = currentuser.token;
        currentUser.get(token).then(function (m) {
            if (m.data.state !== 1) {
                $window.sessionStorage.setItem("user", "");
                alert("请登录");
                window.location.href = "#/index";
            }
        });
    }
    $scope.authornews = [];
    $http({
        method: 'post',
        url: 'news/me'
    }).success(function (m) {
        $scope.authornews = m.data;
    });

    $scope.delnews = function (newsId) {
        $http({
            method: 'post',
            url: 'news/del/' + newsId
        }).success(function (m) {
                alert(m.stateInfo);
                $http({
                    method: 'post',
                    url: 'news/me'
                }).success(function (m) {
                    $scope.authornews = m.data;
                });
            }
        );
    }
});

/**
 * 作者详情
 */
app.controller('authorInfo', function ($scope, $http, $stateParams, $window, currentUser) {

    $scope.newsList = [];
    $scope.newsListsize = 0;
    $scope.author = "";
    // 作者详情
    $http({
        method: 'get',
        url: 'user/author/info/' + $stateParams.authorId
    }).success(function (m) {
        $scope.author = m.data;
        $scope.newsList = m.data.newsList;
        $scope.newsListsize = $scope.newsList.length;
    });


    // 订阅作者
    $scope.subs = function (authorId) {
        var userString = $window.sessionStorage.getItem("user");
        if (userString == null || userString === "") {
            alert("请登录");
        } else {
            var currentuser = JSON.parse(userString);
            var token = currentuser.token;
            currentUser.get(token).then(function (m) {
                if (m.data.state !== 1) {
                    $window.sessionStorage.setItem("user", "");
                    alert("请登录");
                } else {
                    $http({
                        method: 'post',
                        url: '/user/subscribe/' + authorId
                    }).success(function (m) {
                        alert(m.stateInfo);
                    });
                }
            });
        }
    };
});

app.factory('currentUser', function ($http) {
    var doRequest = function (sessionId) {
        return $http({
            method: 'get',
            url: 'user/get/' + sessionId
        });
    };
    return {
        get: function (sessionId) {
            return doRequest(sessionId);
        }
    }
});

//注册服务
app.factory('userRegisterService', ['$http', function ($http) {
    var doRequest = function (user) {
        return $http({
            method: 'POST',
            url: 'user/register',
            data: user,
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        });
    };
    return {
        userRegister: function (user) {
            return doRequest(user);
        }
    }
}]);

app.controller('register', function ($scope, $http, FileUploader, userRegisterService, $window) {
    $scope.canregister = false;
    $scope.user = {username: "", nickname: "", password: "", imagePath: ""};

    /**
     * 检查是否存在相同的登录名
     */
    $scope.checkUsername = function () {
        $http({
            method: 'post',
            url: 'user/checkUsername',
            data: '{"username":"' + $scope.user.username + '"}',
            headers: {
                'Content-Type': 'application/json;charset=UTF-8'
            }
        }).success(function (m) {
            $scope.canregister = m.state !== 1;
        });
    };

    $scope.uploader = new FileUploader({
        url: 'user/uploadUserFile'
    });

    $scope.uploader.onAfterAddingFile = function (fileItem) {
        var length = $scope.uploader.queue.length;
        if (length > 1) {
            $scope.uploader.queue.splice(0, 1);
        }
    };

    $scope.uploader.onSuccessItem = function (item, res, status, headers) {
        $scope.user.imagePath = res.stateInfo;
        $scope.userRegister();
    };

    $scope.submitPic = function () {
        $scope.uploader.uploadAll();
    };

    $scope.checkpwd = "";
    $scope.checkPassword = function () {
        return $scope.user.password !== $scope.checkpwd;
    };

    $scope.userRegister = function () {
        userRegisterService.userRegister($scope.user).then(function (message) {
            var state = message.data.state;
            var data = message.data.data;
            if (state === 1) {
                var user = {"token": data.token, "userId": data.user.userId, "nickname": data.user.nickname};
                $scope.currentuser = user;
                var userString = JSON.stringify(user);
                $window.sessionStorage.setItem("user", userString);
                alert("注册成功");
                $('#modal-register').modal('hide');
                window.history.go(0);
            } else {
                //注册失败
                console.log("error");
            }
        });
    }
});
