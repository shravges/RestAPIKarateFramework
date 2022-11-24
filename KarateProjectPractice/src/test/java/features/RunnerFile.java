package features;

import com.intuit.karate.junit5.Karate;

class RunnerFile {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("APIChaining").relativeTo(getClass());
    }    

}
