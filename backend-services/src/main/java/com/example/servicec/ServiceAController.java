package com.example.servicec;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceAController {
    @GetMapping("/api/service-c")
    public String getServiceC() {
        return "Hello from Service C!";
    }
}
