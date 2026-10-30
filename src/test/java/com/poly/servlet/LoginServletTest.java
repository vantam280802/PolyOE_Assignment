package com.poly.servlet;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServletTest {

    @Mock
    HttpServletRequest request;

    @Mock
    HttpServletResponse response;

    @Mock
    HttpSession session;

    @Mock
    RequestDispatcher dispatcher;

    LoginServlet loginServlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        loginServlet = new LoginServlet();
        
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
    }

    @Test
    public void testLogin_InvalidUsername() throws Exception {
        when(request.getParameter("username")).thenReturn("UserKhongTonTai");
        when(request.getParameter("password")).thenReturn("123456");

        loginServlet.doPost(request, response);

        verify(request).setAttribute("message", "Invalid username");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void testLogin_Success() throws Exception {
        // Đã sửa lại dữ liệu thành TEONV và 123456 theo yêu cầu
        when(request.getParameter("username")).thenReturn("TEONV"); 
        when(request.getParameter("password")).thenReturn("123456"); 
        when(request.getParameter("remember")).thenReturn(null);

        loginServlet.doPost(request, response);

        verify(request).setAttribute("message", "Login successfully");
    }
}