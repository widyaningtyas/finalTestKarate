package examples.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerSpoonacular {
//    @Karate.Test
//    public Karate runConnectUser() {
//        return Karate.run("connectUser").relativeTo(getClass());
//    }

    @Karate.Test
    public Karate runMealPlanRequest() {
        return Karate.run("mealPlanRequest").tags("@test").relativeTo(getClass());
    }
}
