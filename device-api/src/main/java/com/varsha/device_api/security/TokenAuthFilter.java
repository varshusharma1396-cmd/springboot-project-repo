package com.varsha.device_api.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

@Component
public class TokenAuthFilter extends OncePerRequestFilter {

    private static final Logger log = LoggerFactory.getLogger(TokenAuthFilter.class);
    public static final String AUTHORIZED_REQUEST_ATTR = "authorizedRequest";
    private static final String BEARER_PREFIX = "Bearer ";

    private final String expectedToken;

    public TokenAuthFilter(@Value("${app.auth.token}") String expectedToken) {
        this.expectedToken = expectedToken;
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {
        String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        boolean authorized = false;
        String reason = "missing_or_malformed_header";

        if (authHeader != null && authHeader.startsWith(BEARER_PREFIX)) {
            String token = authHeader.substring(BEARER_PREFIX.length());
            authorized = expectedToken.equals(token);
            reason = authorized ? "valid_token" : "invalid_token";
        }

        request.setAttribute(AUTHORIZED_REQUEST_ATTR, authorized);

        if (!authorized) {
            log.warn("Unauthorized request: method={}, path={}, reason={}",
                    request.getMethod(),
                    request.getRequestURI(),
                    reason);
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            response.getWriter().write("{\"error\":\"Unauthorized\"}");
            return;
        }

        log.info("Authorized request: method={}, path={}", request.getMethod(), request.getRequestURI());
        filterChain.doFilter(request, response);
    }
}
