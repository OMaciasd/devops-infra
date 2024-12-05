package com.example.serviced;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceAController {
    @GetMapping("/api/service-d")
    public String getServiceD() {
        return "Hello from Service D!";
    }
}
