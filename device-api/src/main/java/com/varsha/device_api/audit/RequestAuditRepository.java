package com.varsha.device_api.audit;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestAuditRepository extends JpaRepository<RequestAudit, Long> {
}
