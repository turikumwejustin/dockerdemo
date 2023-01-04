package com.softech.dockerdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@RequestMapping("/items")
@Controller
public class ItemController {

    @GetMapping("/")
    private String getItems() {
        System.out.println("......get items");
        return "item";
    }
}
