package com.varsha.device_api.service;

import com.varsha.device_api.dto.DevicePayload;
import com.varsha.device_api.entity.DeviceEvent;

public interface DeviceEventService {
    DeviceEvent saveEvent(DevicePayload payload, String requestPath);
}
