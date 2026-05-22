package com.varsha.device_api.api;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.Instant;

public class DevicePayload {

    @NotBlank
    @JsonProperty("RecordType")
    private String recordType;

    @NotBlank
    @JsonProperty("DeviceId")
    private String deviceId;

    @NotNull
    @JsonProperty("EventDateTime")
    private Instant eventDateTime;

    @NotNull
    @JsonProperty("FieldA")
    private Integer fieldA;

    @NotBlank
    @JsonProperty("FieldB")
    private String fieldB;

    @NotNull
    @JsonProperty("FieldC")
    private BigDecimal fieldC;

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
}
