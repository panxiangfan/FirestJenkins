package com.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Test {


    @RequestMapping(value = "test" ,method = RequestMethod.GET)
    public ModelAndView test(){
        return new ModelAndView ("zhe");
    }

    @RequestMapping(value = "test1", method = RequestMethod.GET)
    public ModelAndView test1(){
        return new ModelAndView("shan");
    }

    @RequestMapping(value = "test2", method = RequestMethod.GET)
    public ModelAndView test2(){
        return new ModelAndView("zhu");
    }
}
