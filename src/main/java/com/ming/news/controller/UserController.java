package com.ming.news.controller;

import com.ming.news.enums.StatEnum;
import com.ming.news.exception.LoginException;
import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.User;
import com.ming.news.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Create by ming on 19-1-4 下午5:23
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@RestController
@Slf4j
@RequestMapping("user")
@CrossOrigin
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("login")
    public RequestResult login(@RequestBody Map<String, String> map, HttpSession session) {
        String username = map.get("username");
        String password = map.get("password");
        User user = userService.findUser(username, password);
        Map<String, Object> data = new ConcurrentHashMap<>();
        if (user != null) {
            user.setPassword("");
            session.setAttribute("user", user);
            data.put("user", user);
            data.put("token", session.getId());
            return new RequestResult<>(StatEnum.OK, data);
        } else {
            throw new LoginException(StatEnum.USERNAME_OR_PASSWORD_ERROR);
        }
    }

    @GetMapping("/get/{sessionId}")
    public RequestResult getUser(@PathVariable("sessionId") String sessionId, HttpSession session) {
        if (sessionId.equals(session.getId())) {
            return new RequestResult(1, "已登录");
        }
        return new RequestResult(0, "未登录");
    }

    @PostMapping("logout")
    public RequestResult logout(HttpSession session) {
        session.invalidate();
        return new RequestResult(1, "注销成功");
    }

    @PostMapping("checkUsername")
    public RequestResult checkUsername(@RequestBody Map<String, String> map) {
        String username = map.get("username");
        if (userService.checkUsername(username)) {
            return new RequestResult(1, "没有重复");
        } else {
            return new RequestResult(0, "有重复");
        }
    }

    @PostMapping("uploadUserFile")
    public RequestResult uploadUserFile(HttpServletRequest request, MultipartFile file) throws IOException {
        String imagePath;
        if (null != file && !file.isEmpty()) {
            String filename = file.getOriginalFilename();
            //文件上传
            assert filename != null;
            String newFilename = UUID.randomUUID().toString().replace("-", "") + filename.substring(filename.lastIndexOf("."));

            FileUtils.copyInputStreamToFile(file.getInputStream(),
                    new File(request.getServletContext().getRealPath("/image/user/"), newFilename));
            imagePath = "/image/user/" + newFilename;
        } else {
            imagePath = "/image/user/default.jpg";
        }
        return new RequestResult(1, imagePath);
    }

    @PostMapping("register")
    public RequestResult register(@RequestBody User user, HttpSession session) {
        Map<String, Object> data = new ConcurrentHashMap<>();
        User result = userService.register(user);
        session.setAttribute("user", result);
        result.setPassword("");
        session.setAttribute("user", user);
        data.put("user", user);
        data.put("token", session.getId());
        return new RequestResult<>(StatEnum.OK, data);
    }

    @PostMapping("info")
    public RequestResult getUserInfo(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return new RequestResult<>(StatEnum.OK, user);
    }

    @GetMapping("author/info/{authorId}")
    public RequestResult getAuthorInfo(@PathVariable("authorId") Integer authorId) {
        return userService.getAuthorInfo(authorId);
    }

    @PostMapping("subscribe/{authorId}")
    public RequestResult subscribe(HttpSession session, @PathVariable("authorId") Integer authorId) {
        User user = (User) session.getAttribute("user");
        return userService.subscribe(user.getUserId(), authorId);
    }

    @PostMapping("getSubscription")
    public RequestResult getSubscription(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return userService.getSubscription(user.getUserId());
    }

    @PostMapping("delSubscription/{authorId}")
    public RequestResult delSubscription(HttpSession session, @PathVariable("authorId") Integer authorId) {
        User user = (User) session.getAttribute("user");
        return userService.delSubscription(user.getUserId(), authorId);
    }

    @PostMapping("updateImage")
    public RequestResult updateImage(HttpSession session, @RequestBody Map<String, String> map) {
        User user = (User) session.getAttribute("user");
        return userService.updateImage(map.get("imagePath"), user.getUserId());
    }

    @PostMapping("updateIntroduction")
    public RequestResult updateIntroduction(HttpSession session, @RequestBody Map<String, String> map) {
        User user = (User) session.getAttribute("user");
        return userService.updateIntroduction(map.get("content"), user.getUserId());
    }
}
