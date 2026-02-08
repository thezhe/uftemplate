package src.functions;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.function.Function;
import java.util.logging.Logger;

import com.fasterxml.jackson.databind.json.JsonMapper;

import src.build.json.Config;

public final class Args2Config implements Function<String[], Config> {

    // TODO lombok?
    final JsonMapper mapper;

    public Args2Config(JsonMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public Config apply(String[] args) {
        final var argsList = Arrays.asList(args);
        if (argsList.stream().anyMatch(Arrays.asList("-h", "--help")::contains)) {
            System.out.println("Usage: java -jar <jar> <config>");
            System.exit(0);
        }
        try {
            return mapper.readValue(Files.readString(Path.of(argsList.getLast())), Config.class);
        } catch (IOException e) {
            Logger.getGlobal().severe(e.getMessage()); // TODO lombok?
            System.exit(1);
            return new Config();
        }
    }

}
