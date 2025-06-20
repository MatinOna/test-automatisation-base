import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
        System.getProperty("karate.options");
        System.getProperty("karate.env");
    }
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:karate-test.feature");
    }

}
