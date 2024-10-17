package examples.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerWeather {

    @Karate.Test
    public Karate runWeatherRequest() {
        return Karate.run("weatherRequest").relativeTo(getClass());
    }
}
