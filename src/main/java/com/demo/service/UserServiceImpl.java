package com.demo.service;

import com.demo.dao.UserMapper;
import com.demo.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper mapper;
     @Override
     public List<User> selectAll(){
         return mapper.selectAll();
     }
 }