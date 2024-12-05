package com.example.servicea;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceAController {
    @GetMapping("/api/service-a")
    public String getServiceA() {
        return "Hello from Service A!";
    }
}
