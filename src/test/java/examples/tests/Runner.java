package examples.tests;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    public Karate runPet(){
        return Karate.run("petRequest").relativeTo(getClass());
    }
    @Karate.Test
    public Karate runUser(){
        return Karate.run("userRequest").relativeTo(getClass());
    }
}
