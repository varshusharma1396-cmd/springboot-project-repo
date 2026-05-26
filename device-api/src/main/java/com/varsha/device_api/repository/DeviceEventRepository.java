package com.varsha.device_api.repository;

import com.varsha.device_api.entity.DeviceEvent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceEventRepository extends JpaRepository<DeviceEvent, Long> {
}
