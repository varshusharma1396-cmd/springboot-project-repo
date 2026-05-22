package com.varsha.device_api;

import com.varsha.device_api.audit.RequestAuditRepository;
import com.varsha.device_api.device.DeviceEventRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class DeviceApiApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private DeviceEventRepository deviceEventRepository;

	@Autowired
	private RequestAuditRepository requestAuditRepository;

	private static final String SAMPLE_PAYLOAD = """
			{
			  "RecordType":"xxx",
			  "DeviceId":"357370040159770",
			  "EventDateTime":"2014-05-12T05:09:48Z",
			  "FieldA":68,
			  "FieldB":"xxx",
			  "FieldC":123.45
			}
			""";

	private static final String INVALID_PAYLOAD = """
			{
			  "DeviceId":"357370040159770",
			  "EventDateTime":"2014-05-12T05:09:48Z",
			  "FieldA":68,
			  "FieldB":"xxx",
			  "FieldC":123.45
			}
			""";

	private static final String TOKEN = "Bearer test-token-123";

	@BeforeEach
	void setUp() {
		requestAuditRepository.deleteAll();
		deviceEventRepository.deleteAll();
	}

	@Test
	void echoEndpointReturnsOriginalPayload() throws Exception {
		mockMvc.perform(post("/echo")
						.contentType(MediaType.APPLICATION_JSON)
						.header(HttpHeaders.AUTHORIZATION, TOKEN)
						.content(SAMPLE_PAYLOAD))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.RecordType").value("xxx"))
				.andExpect(jsonPath("$.DeviceId").value("357370040159770"))
				.andExpect(jsonPath("$.EventDateTime").value("2014-05-12T05:09:48Z"))
				.andExpect(jsonPath("$.FieldA").value(68))
				.andExpect(jsonPath("$.FieldB").value("xxx"))
				.andExpect(jsonPath("$.FieldC").value(123.45));
		assertEquals(1, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

	@Test
	void deviceEndpointReturnsOnlyDeviceId() throws Exception {
		mockMvc.perform(post("/device")
						.contentType(MediaType.APPLICATION_JSON)
						.header(HttpHeaders.AUTHORIZATION, TOKEN)
						.content(SAMPLE_PAYLOAD))
				.andExpect(status().isOk())
				.andExpect(content().json("{\"DeviceId\":\"357370040159770\"}"));
		assertEquals(1, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

	@Test
	void noContentEndpointReturns204() throws Exception {
		mockMvc.perform(post("/nocontent")
						.contentType(MediaType.APPLICATION_JSON)
						.header(HttpHeaders.AUTHORIZATION, TOKEN)
						.content(SAMPLE_PAYLOAD))
				.andExpect(status().isNoContent());
		assertEquals(1, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

	@Test
	void unsupportedEndpointReturns400() throws Exception {
		mockMvc.perform(post("/unknown")
						.contentType(MediaType.APPLICATION_JSON)
						.header(HttpHeaders.AUTHORIZATION, TOKEN)
						.content(SAMPLE_PAYLOAD))
				.andExpect(status().isBadRequest());
		assertEquals(1, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

	@Test
	void missingTokenReturns401() throws Exception {
		mockMvc.perform(post("/echo")
						.contentType(MediaType.APPLICATION_JSON)
						.content(SAMPLE_PAYLOAD))
				.andExpect(status().isUnauthorized());
		assertEquals(0, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

	@Test
	void invalidPayloadReturns400() throws Exception {
		mockMvc.perform(post("/echo")
						.contentType(MediaType.APPLICATION_JSON)
						.header(HttpHeaders.AUTHORIZATION, TOKEN)
						.content(INVALID_PAYLOAD))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.error").value("Validation failed"));
		assertEquals(0, deviceEventRepository.count());
		assertEquals(1, requestAuditRepository.count());
	}

}
