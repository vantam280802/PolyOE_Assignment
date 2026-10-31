package com.poly.servlet;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.time.Duration;
import static org.junit.jupiter.api.Assertions.assertEquals;

@Disabled("Bỏ qua test giao diện trên GitHub Actions vì máy ảo không có UI")
public class SeleniumLoginTest {
    
    WebDriver driver;

    @BeforeEach
    public void setUp() {
        driver = new ChromeDriver();
        driver.manage().window().maximize(); 
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); 
    }

    @Test
    public void testLoginUI_Success() throws InterruptedException {
        driver.get("http://localhost:8080/PolyOE_Project/login");

        WebElement txtUsername = driver.findElement(By.name("username"));
        txtUsername.sendKeys("TEONV");

        WebElement txtPassword = driver.findElement(By.name("password"));
        txtPassword.sendKeys("123456");

        Thread.sleep(2000); 

        WebElement btnLogin = driver.findElement(By.xpath("//button[text()='Login']"));
        btnLogin.click();

        Thread.sleep(2000); 
        String currentUrl = driver.getCurrentUrl();
        assertEquals("http://localhost:8080/PolyOE_Project/", currentUrl);
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}