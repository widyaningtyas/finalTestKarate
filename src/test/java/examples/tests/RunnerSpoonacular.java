package examples.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerSpoonacular {
    @Karate.Test
    public Karate runIngredient() {
        return Karate.run("spoonacular").relativeTo(getClass());
    }
}
