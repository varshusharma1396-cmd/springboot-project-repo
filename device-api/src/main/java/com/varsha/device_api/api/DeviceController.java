package com.varsha.device_api.api;

import com.varsha.device_api.device.DeviceEvent;
import com.varsha.device_api.device.DeviceEventRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.Map;

@RestController
public class DeviceController {

    private static final Logger log = LoggerFactory.getLogger(DeviceController.class);
    private final DeviceEventRepository deviceEventRepository;

    public DeviceController(DeviceEventRepository deviceEventRepository) {
        this.deviceEventRepository = deviceEventRepository;
    }

    @PostMapping("/**")
    public ResponseEntity<?> handle(
            @Valid @RequestBody DevicePayload payload,
            HttpServletRequest request
    ) {
        String path = normalizePath(request);
        log.info("Received device payload: method={}, path={}, deviceId={}, recordType={}",
                request.getMethod(),
                path,
                payload.getDeviceId(),
                payload.getRecordType());

        deviceEventRepository.save(DeviceEvent.fromPayload(payload, path, Instant.now()));
        log.info("Payload persisted for deviceId={} at path={}", payload.getDeviceId(), path);

        if (path.endsWith("/nocontent")) {
            log.info("Responding 204 for path={}", path);
            return ResponseEntity.noContent().build();
        }

        if ("/echo".equals(path)) {
            log.info("Responding 200 echo for path={}", path);
            return ResponseEntity.ok(payload);
        }

        if ("/device".equals(path)) {
            log.info("Responding 200 deviceId only for path={}", path);
            return ResponseEntity.ok(Map.of("DeviceId", payload.getDeviceId()));
        }

        log.warn("Unsupported endpoint path={}, responding 400", path);
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("error", "Unsupported endpoint"));
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
