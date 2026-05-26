package com.varsha.device_api.entity;

import com.varsha.device_api.dto.DevicePayload;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "device_events")
public class DeviceEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String recordType;

    @Column(nullable = false)
    private String deviceId;

    @Column(nullable = false)
    private Instant eventDateTime;

    @Column(nullable = false)
    private Integer fieldA;

    @Column(nullable = false)
    private String fieldB;

    @Column(nullable = false, precision = 18, scale = 4)
    private BigDecimal fieldC;

    @Column(nullable = false)
    private String requestPath;

    @Column(nullable = false)
    private Instant receivedAt;

    public void applyPayload(DevicePayload payload, String path) {
        setRecordType(payload.getRecordType());
        setDeviceId(payload.getDeviceId());
        setEventDateTime(payload.getEventDateTime());
        setFieldA(payload.getFieldA());
        setFieldB(payload.getFieldB());
        setFieldC(payload.getFieldC());
        setRequestPath(path);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public Instant getEventDateTime() {
        return eventDateTime;
    }

    public void setEventDateTime(Instant eventDateTime) {
        this.eventDateTime = eventDateTime;
    }

    public Integer getFieldA() {
        return fieldA;
    }

    public void setFieldA(Integer fieldA) {
        this.fieldA = fieldA;
    }

    public String getFieldB() {
        return fieldB;
    }

    public void setFieldB(String fieldB) {
        this.fieldB = fieldB;
    }

    public BigDecimal getFieldC() {
        return fieldC;
    }

    public void setFieldC(BigDecimal fieldC) {
        this.fieldC = fieldC;
    }

    public String getRequestPath() {
        return requestPath;
    }

    public void setRequestPath(String requestPath) {
        this.requestPath = requestPath;
    }

    public Instant getReceivedAt() {
        return receivedAt;
    }

    public void setReceivedAt(Instant receivedAt) {
        this.receivedAt = receivedAt;
    }

}
