package com.varsha.device_api.audit;

import com.varsha.device_api.security.TokenAuthFilter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.Instant;

@Component
public class RequestAuditFilter extends OncePerRequestFilter {

    private static final Logger log = LoggerFactory.getLogger(RequestAuditFilter.class);
    private final RequestAuditRepository requestAuditRepository;

    public RequestAuditFilter(RequestAuditRepository requestAuditRepository) {
        this.requestAuditRepository = requestAuditRepository;
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {
        long start = System.currentTimeMillis();

        ContentCachingRequestWrapper wrappedRequest = new ContentCachingRequestWrapper(request, 1024 * 1024);
        ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(response);

        try {
            filterChain.doFilter(wrappedRequest, wrappedResponse);
        } finally {
            RequestAudit audit = new RequestAudit();
            audit.setMethod(wrappedRequest.getMethod());
            audit.setPath(wrappedRequest.getRequestURI());
            audit.setStatusCode(wrappedResponse.getStatus());
            audit.setCreatedAt(Instant.now());

            Object authorizedAttr = wrappedRequest.getAttribute(TokenAuthFilter.AUTHORIZED_REQUEST_ATTR);
            audit.setAuthorized(Boolean.TRUE.equals(authorizedAttr));

            byte[] requestBodyBytes = wrappedRequest.getContentAsByteArray();
            if (requestBodyBytes.length > 0) {
                audit.setRequestBody(new String(requestBodyBytes, StandardCharsets.UTF_8));
            }

            requestAuditRepository.save(audit);
            long durationMs = System.currentTimeMillis() - start;
            log.info("Audit saved: method={}, path={}, status={}, authorized={}, durationMs={}",
                    audit.getMethod(),
                    audit.getPath(),
                    audit.getStatusCode(),
                    audit.getAuthorized(),
                    durationMs);
            wrappedResponse.copyBodyToResponse();
        }
    }

    @Override
    protected boolean shouldNotFilterErrorDispatch() {
        return true;
    }
}
