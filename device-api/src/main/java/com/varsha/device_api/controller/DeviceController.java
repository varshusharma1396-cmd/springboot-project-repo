package com.varsha.device_api.controller;

import com.varsha.device_api.dto.DevicePayload;
import com.varsha.device_api.service.DeviceEventService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class DeviceController {

    private static final Logger log = LoggerFactory.getLogger(DeviceController.class);
    private final DeviceEventService deviceEventService;

    public DeviceController(DeviceEventService deviceEventService) {
        this.deviceEventService = deviceEventService;
    }

    @PostMapping("/echo")
    public ResponseEntity<DevicePayload> echo(
            @Valid @RequestBody DevicePayload payload,
            HttpServletRequest request
    ) {
        String path = normalizePath(request);
        persistEvent(payload, request.getMethod(), path);
        log.info("Responding 200 echo for path={}", path);
        return ResponseEntity.ok(payload);
    }

    @PostMapping("/device")
    public ResponseEntity<Map<String, String>> device(
            @Valid @RequestBody DevicePayload payload,
            HttpServletRequest request
    ) {
        String path = normalizePath(request);
        persistEvent(payload, request.getMethod(), path);
        log.info("Responding 200 deviceId only for path={}", path);
        return ResponseEntity.ok(Map.of("DeviceId", payload.getDeviceId()));
    }

    @PostMapping("/nocontent")
    public ResponseEntity<Void> noContent(
            @Valid @RequestBody DevicePayload payload,
            HttpServletRequest request
    ) {
        String path = normalizePath(request);
        persistEvent(payload, request.getMethod(), path);
        log.info("Responding 204 for path={}", path);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/**")
    public ResponseEntity<?> unsupported(
            @Valid @RequestBody DevicePayload payload,
            HttpServletRequest request
    ) {
        String path = normalizePath(request);

        if (path.endsWith("/nocontent")) {
            persistEvent(payload, request.getMethod(), path);
            log.info("Responding 204 for suffix nocontent path={}", path);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        }

        log.info("Skipping device_events save for unsupported path={}", path);
        log.warn("Unsupported endpoint path={}, responding 400", path);
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Unsupported endpoint"));
    }

    private void persistEvent(DevicePayload payload, String method, String path) {
        log.info("Received device payload: method={}, path={}, deviceId={}, recordType={}",
                method,
                path,
                payload.getDeviceId(),
                payload.getRecordType());

        deviceEventService.saveEvent(payload, path);
        log.info("Payload saved for deviceId={} at path={}", payload.getDeviceId(), path);
    }

    private String normalizePath(HttpServletRequest request) {
        String path = request.getRequestURI();
        String contextPath = request.getContextPath();
        if (contextPath != null && !contextPath.isBlank() && path.startsWith(contextPath)) {
            return path.substring(contextPath.length());
        }
        return path;
    }
}
