package com.varsha.device_api.service.impl;

import com.varsha.device_api.dto.DevicePayload;
import com.varsha.device_api.entity.DeviceEvent;
import com.varsha.device_api.repository.DeviceEventRepository;
import com.varsha.device_api.service.DeviceEventService;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
public class DeviceEventServiceImpl implements DeviceEventService {

    private final DeviceEventRepository deviceEventRepository;

    public DeviceEventServiceImpl(DeviceEventRepository deviceEventRepository) {
        this.deviceEventRepository = deviceEventRepository;
    }

    @Override
    public DeviceEvent saveEvent(DevicePayload payload, String requestPath) {
        Instant now = Instant.now();
        DeviceEvent deviceEvent = new DeviceEvent();
        deviceEvent.setReceivedAt(now);
        deviceEvent.applyPayload(payload, requestPath);
        return deviceEventRepository.save(deviceEvent);
    }
}
