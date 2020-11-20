package com.demo.service;

import com.demo.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
     List<User> selectAll();
}