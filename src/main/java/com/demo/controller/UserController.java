package com.demo.controller;

import com.demo.entity.User;
import com.demo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
     @Resource
     private UserService service;

     @RequestMapping("/getdata")
     @ResponseBody
     public List<User> showData(){
        List<User> userArrayList = new ArrayList<>();
         userArrayList = service.selectAll();

         System.out.println(userArrayList);
        return userArrayList;
     }

     @RequestMapping("/")
     public String index(){

        return "test";
     }

 }