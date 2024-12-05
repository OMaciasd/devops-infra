package com.example.serviceb;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceBController {
    @GetMapping("/api/service-b")
    public String getServiceB() {
        return "Hello from Service B!";
    }
}
