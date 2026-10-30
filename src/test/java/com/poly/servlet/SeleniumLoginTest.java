package com.poly.servlet;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.time.Duration;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class SeleniumLoginTest {
    
    WebDriver driver;

    @BeforeEach
    public void setUp() {
        // Khởi tạo trình duyệt Chrome (Selenium 4.6+ sẽ tự động tải ChromeDriver)
        driver = new ChromeDriver();
        driver.manage().window().maximize(); // Phóng to toàn màn hình
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Thời gian chờ tối đa tải phần tử
    }

    @Test
    public void testLoginUI_Success() throws InterruptedException {
        // 1. Máy tính tự động mở đường dẫn trang Đăng nhập
        driver.get("http://localhost:8080/PolyOE_Project/login");

        // 2. Tự động tìm ô Username và điền "TEONV"
        WebElement txtUsername = driver.findElement(By.name("username"));
        txtUsername.sendKeys("TEONV");

        // 3. Tự động tìm ô Password và điền "123456"
        WebElement txtPassword = driver.findElement(By.name("password"));
        txtPassword.sendKeys("123456");

        // Dừng 2 giây để bạn kịp nhìn bằng mắt thường các dữ liệu máy vừa nhập
        Thread.sleep(2000); 

        // 4. Tìm nút "Login" và tự động click
        WebElement btnLogin = driver.findElement(By.xpath("//button[text()='Login']"));
        btnLogin.click();

        // 5. Đợi 2 giây cho web chuyển trang và kiểm tra xem có đúng là bị đẩy về trang chủ không
        Thread.sleep(2000); 
        String currentUrl = driver.getCurrentUrl();
        assertEquals("http://localhost:8080/PolyOE_Project/", currentUrl);
    }

    @AfterEach
    public void tearDown() {
        // Đóng trình duyệt sau khi test xong
        if (driver != null) {
            driver.quit();
        }
    }
}