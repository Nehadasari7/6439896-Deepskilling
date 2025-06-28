package com.example;

public class MyApp {

    private NotificationService notificationService;

    public MyApp(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void process() {
        notificationService.sendNotification("user@example.com", "Welcome to the app!");
    }
}
