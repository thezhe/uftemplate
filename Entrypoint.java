//JAVA 25
//DEPS com.fasterxml.jackson.core:jackson-databind:2.21.0
//DEPS com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.21.0

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;

import src.functions.Args2Config;

void main(String... args) {
    final var jsonMapper = JsonMapper.builder()
            .addModule(new Jdk8Module())
            .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
            .build();
    final var config = new Args2Config(jsonMapper).apply(args);
    config.getT();
}
