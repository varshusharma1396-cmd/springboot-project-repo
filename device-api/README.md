# Device API Practical Test

## What this implementation includes
- JSON payload accepted over HTTP `POST`
- Mandatory field validation
- Simple Bearer token authorization
- MySQL persistence for payload data
- Request auditing to database
- Integration tests (MockMvc + H2)
- `curl` demo commands

## Configuration
Default local configuration is in [application.properties](/C:/Users/sharm/Downloads/device-api/device-api/src/main/resources/application.properties):
- MySQL: `jdbc:mysql://localhost:3306/device_api`
- Username: `root`
- Password: `root`
- Token: `test-token-123`

## Run
1. Install Java 17+ and set `JAVA_HOME`.
2. Start MySQL on `localhost:3306`.
3. Start app:
   ```bash
   ./mvnw spring-boot:run
   ```

## Sample payload
```json
{
  "RecordType": "xxx",
  "DeviceId": "357370040159770",
  "EventDateTime": "2014-05-12T05:09:48Z",
  "FieldA": 68,
  "FieldB": "xxx",
  "FieldC": 123.45
}
```

## curl demo
`/echo` -> `200` + full payload:
```bash
curl -i -X POST http://localhost:8080/echo \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer test-token-123" \
  -d '{"RecordType":"xxx","DeviceId":"357370040159770","EventDateTime":"2014-05-12T05:09:48Z","FieldA":68,"FieldB":"xxx","FieldC":123.45}'
```

`/device` -> `200` + only `DeviceId`:
```bash
curl -i -X POST http://localhost:8080/device \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer test-token-123" \
  -d '{"RecordType":"xxx","DeviceId":"357370040159770","EventDateTime":"2014-05-12T05:09:48Z","FieldA":68,"FieldB":"xxx","FieldC":123.45}'
```

`/nocontent` -> `204`:
```bash
curl -i -X POST http://localhost:8080/nocontent \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer test-token-123" \
  -d '{"RecordType":"xxx","DeviceId":"357370040159770","EventDateTime":"2014-05-12T05:09:48Z","FieldA":68,"FieldB":"xxx","FieldC":123.45}'
```

Any other path -> `400`:
```bash
curl -i -X POST http://localhost:8080/anything-else \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer test-token-123" \
  -d '{"RecordType":"xxx","DeviceId":"357370040159770","EventDateTime":"2014-05-12T05:09:48Z","FieldA":68,"FieldB":"xxx","FieldC":123.45}'
```

Invalid or missing token -> `401`.
